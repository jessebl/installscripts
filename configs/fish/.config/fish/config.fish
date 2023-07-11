set -q XDG_CONFIG_HOME; or set -x XDG_CONFIG_HOME ~/.config

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if test -f $XDG_CONFIG_HOME/fish/local.fish
	source $XDG_CONFIG_HOME/fish/local.fish
end

set -x PATH ~/.local/bin $PATH

fish_import_bash_aliases

set fish_greeting

if command -v fd > /dev/null
    set -x FZF_CD_COMMAND "fd --type d"
    set -x FZF_CD_WITH_HIDDEN_COMMAND "$FZF_CD_COMMAND --hidden"
    set -x FZF_FIND_FILE_COMMAND "fd --type f . \$dir"
    # Re-export to use above variable
    set -x FZF_OPEN_COMMAND "$FZF_FIND_FILE_COMMAND"
end
if command -v rg > /dev/null
    set -x FZF_FIND_FILE_COMMAND "rg --color auto --files \$dir"
end
set -x FZF_CD_OPTS "--preview='ls -l {}'"
set -x FZF_PREVIEW_FILE_CMD "head -n 10"
# Re-export to use above variable
set -x FZF_OPEN_COMMAND "$FZF_FIND_FILE_COMMAND"

set -x GOPATH ~/code/go && mkdir -p $GOPATH
set PATH $GOPATH/bin $PATH

# alias em "emacsclient -c"
# alias vi "emacsclient"
test -d ~/.emacs.d/bin && set PATH $PATH ~/.emacs.d/bin
if test -d $HOME/.config/doom
    set -x DOOMDIR $HOME/.config/doom
else if test -d $HOME/.doom.d
    set -x DOOMDIR $HOME/.doom.d
end
alias gd "git diff"
alias gc "git commit -v"
alias gl "git log"
alias gst "git status"
alias ga "git add"

alias tf "terraform"

if command -v nvim > /dev/null
    set -x EDITOR nvim
end

alias "meshcommander" "node ~/code/meshcommander/node_modules/meshcommander/meshcommander.js"

alias ssh "kitty +kitten ssh"

if test -e ~/.nix-profile/etc/profile.d/nix.sh; and type -q fenv
    fenv source ~/.nix-profile/etc/profile.d/nix.sh
end

# Add bash's keybinding to open the command line in $EDITOR
# (fish has \ev and \ee by default)
bind \cx\ce edit_command_buffer

function nomash
    set job (nomad job allocs $argv | grep running | awk '{print $1}' | head -n 1)
    nomad exec "$job" /bin/sh
end
