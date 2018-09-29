[ -f ~/.bash_aliases ] && source ~/.bash_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

export GOPATH=$HOME/code/go
[ -d $GOPATH/bin ] && path+=$GOPATH/bin

# Set up prompt
autoload -U colors && colors
prompt_color='red'
if [[ -v SSH_CLIENT || -v SSH_CONNECTION || -v SSH_TTY ]]; then
  hoststring="${(%):-%m}: " && prompt_color='blue'
fi
PROMPT="%{$fg[$prompt_color]%}[%{$fg[default]%} "$hoststring"%. %{$fg[$prompt_color]%}]$%{$fg[default]%} "

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# Bind delete key
# https://stackoverflow.com/a/686458
[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# bindkey -M menuselect '^[[Z' reverse-menu-complete

# Make sure <C-w> deletes non-alphanumeric-delimeted words (not space-delimeted)
autoload -U select-word-style
select-word-style bash

# Up-arrow completion
# https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

prompt_git() {
  # Empty if git not in PATH
  (( $+commands[git] )) || return
  # Build prompt if in git repo
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    # Add in a dot if there are unstaged changes
    unstaged_changes=$(git diff --shortstat 2> /dev/null | tail -n1``)
    if [[ -n $unstaged_changes ]]; then changed='\u2219'; else changed=""; fi
    # Set propmpt color to yellow if dirty, green if clean
    git_status=$(git status --porcelain)
    if [[ -n $git_status ]]; then color="yellow"; else color="green"; fi
    # Display branch name if on branch, or abbreviated hash if floating head
    ref="\ue0a0 $(git symbolic-ref --short HEAD 2> /dev/null)" ||
      ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    echo "%{$fg[$color]%}$changed$ref%{$fg[default]%}" && return
  fi
}

setopt prompt_subst
RPROMPT='$(prompt_git)'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jesse/.local/lib/gcloud/path.zsh.inc' ]; then . '/home/jesse/.local/lib/gcloud/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jesse/.local/lib/gcloud/completion.zsh.inc' ]; then . '/home/jesse/.local/lib/gcloud/completion.zsh.inc'; fi
