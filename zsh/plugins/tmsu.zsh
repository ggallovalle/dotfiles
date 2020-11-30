function tmsu.mine() {
    cd $GHQ[home]
    column -t <(
        for it in *; do
            tmsu tags $it | sed 's/://g'
        done
    )         
    cd -
}

function tmsu.others() {
    cd $GHQ[github]
    column -t <(
        for it in */*; do
            tmsu tags $it | sed 's/://g; /ggallovalle/d' 
        done
    ) 
    cd -
}
