# defaults
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
DOTFILES=${DOTFILES:-$HOME/.dotfiles}
g_e() { echo -e "\033[0;31m--------------- $* ---------------\033[0m"; }
g_k() { echo -e "\033[0;32m--------------- $* ----------------\033[0m"; }
g_w() { echo -e "\033[1;33m--------------- $* ----------------\033[0m"; }
g_clonner() {
    # $1 info title
    # $3 destination
    # ${@:2} git arguments
    if [[ ! -d "$3" ]]; then
        g_k cloning "$1"
        if ! git clone "${@:2}"; then
            g_e $1 could not be cloned
            exit
        fi
    fi
    g_k "$1" '->' "$3"
}
g_pkg() {
    # $1 command
    # $2 package to install
    if ! command -v "$1" &>/dev/null; then
        paru -Si "$2"
        if ! paru -S "$2"; then
            g_e $2 could not be installed
            exit
        fi
    fi
    g_k "$1" installed
}
g_confirm() {
    read -p "Are you sure? [Y/y] " -n 1 -r
    echo 
    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return
    fi
    return 1
}
