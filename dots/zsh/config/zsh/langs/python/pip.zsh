### generic
# pip.h
# pip.run
# pip.search
# pip.new
# pip.watch


### install
# pip.in
# pip.un


### manage dependencies
# pip.ls
# pip.lsD
# pip.lsT
# pip.ad
# pip.adD
# pip.adT
# pip.rm
# pip.rmD
# pip.rmT

# generic
alias pip.se='pip search'
alias pip.h='pip -h'
# one time
alias pip.in='pip install -r requirements.txt'
# manage dependencies
function pip.ad() {
    for pkg in $*; do
        pip install "$pkg" && {
            name="$(pip show "$pkg" | grep Name: | awk '{print $2}')";
            version="$(pip show "$pkg" | grep Version: | awk '{print $2}')";
            echo "${name}==${version}" >> requirements.txt;
        }
    done
}

function pip.adD() {
    for pkg in $*; do
        pip install "$pkg" && {
            name="$(pip show "$pkg" | grep Name: | awk '{print $2}')";
            version="$(pip show "$pkg" | grep Version: | awk '{print $2}')";
            echo "${name}==${version}" >> requirements-dev.txt;
        }
    done
}


function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}


compctl -K _pip_completion pip
