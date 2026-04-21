function lfcd
    set -l tmp (mktemp)
    lf -last-dir-path=$tmp $argv
    if [ -f $tmp ]
        set -l dir (cat $tmp)
        rm -f $tmp
        if [ -d $dir ]
            set -l curr (pwd)
            if [ "$dir" != (pwd) ]
                cd $dir
            end
        end
    end
end
