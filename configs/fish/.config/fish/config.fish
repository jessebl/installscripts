if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

fish_import_bash_aliases

set fish_greeting

if command -v fd > /dev/null
    set -U FZF_CD_COMMAND "fd --type d"
    set -U FZF_CD_WITH_HIDDEN_COMMAND "$FZF_CD_COMMAND --hidden"
    set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"
    # Re-export to use above variable
    set -U FZF_OPEN_COMMAND "$FZF_FIND_FILE_COMMAND"
end
if command -v rg > /dev/null
    set -U FZF_FIND_FILE_COMMAND "rg --color auto --files \$dir"
end
set -U FZF_CD_OPTS "--preview='ls -l {}'"
set -U FZF_PREVIEW_FILE_CMD "head -n 10"
# Re-export to use above variable
set -U FZF_OPEN_COMMAND "$FZF_FIND_FILE_COMMAND"
