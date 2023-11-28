#!/bin/sh

if [ $# -ne 2 ]; then
    echo "aborting...two args required"
    echo "    1) local file path to this repo directory"
    echo "    2) file path to custom system.el file to link to"
    echo "    e.g."
    echo "    ./symlink-emacs-cfg.sh . ~/tmp/system.el"
    exit 1
fi

EMACS_CFG="$HOME/.config/emacs"
EMACS_REPO=$(realpath "$1")
SYSTEM_EL_PATH=$(realpath "$2")

echo ""
echo ">>> removing links in $EMACS_CFG"

find "$EMACS_CFG" -type l

echo ""

find "$EMACS_CFG" -type l -exec rm -f {} +

if [ "$1" = "clean" ]; then
    echo ">>> clean done. will not relink."
    exit 0
fi

echo ">>> linking system.el into $EMACS_REPO"

ln -svf -t "$EMACS_REPO" "$SYSTEM_EL_PATH"

echo ""

link_emacs () {
    ln -svf -t "$EMACS_CFG" "$EMACS_REPO/$1"
}

echo ">>> relinking:"

link_emacs early-init.el
link_emacs init.el
link_emacs core.el
link_emacs functions
link_emacs packages
link_emacs modes
link_emacs system.el
link_emacs keybindings.el

echo ""
