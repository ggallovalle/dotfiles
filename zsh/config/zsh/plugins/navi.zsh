function navi.run() {
    navi --query "$1 "
}
function navi.print() {
    navi --query "$1 "  --print
}
function navi.copy() {
    local query=$(navi --query "$1 " --print )
    echo $query | xclip -sel clip
    +zinit-message "{info3}$query{rst}"
}
