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
alias gd "git diff"
alias gc "git commit"
alias gl "git log"
alias gst "git status"
alias ga "git add"

alias tf "terraform"

if command -v nvim > /dev/null
    set -x EDITOR nvim
end

alias "meshcommander" "node ~/code/meshcommander/node_modules/meshcommander/meshcommander.js"

alias ssh "kitty +kitten ssh"
