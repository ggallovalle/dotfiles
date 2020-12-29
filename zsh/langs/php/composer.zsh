### generic
# composer.h
# composer.run
# composer.search
# composer.new
# composer.watch


### install
# composer.in
# composer.un


### manage dependencies
# composer.ls
# composer.lsD
# composer.lsT
# composer.ad
# composer.adD
# composer.adT
# composer.rm
# composer.rmD
# composer.rmT

function php.pm() {
    case "$1" in
        ad)
            shift
            composer require "$@"
            ;;
        adD)
            shift
            composer require --dev "$@"
            ;;
        rm)
            shift
            composer remove "$@"
            ;;
        rmD)
            shift
            composer remove --dev "$@"
            ;;
        *)
            composer "$@"
            ;;
    esac
}
