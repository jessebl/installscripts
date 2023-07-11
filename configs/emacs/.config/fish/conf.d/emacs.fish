# alias em "emacsclient -c"
# alias vi "emacsclient"
test -d ~/.emacs.d/bin && set PATH $PATH ~/.emacs.d/bin
if test -d $HOME/.config/doom
    set -x DOOMDIR $HOME/.config/doom
else if test -d $HOME/.doom.d
    set -x DOOMDIR $HOME/.doom.d
end
