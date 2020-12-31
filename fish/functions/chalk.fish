function chalk -a spec -d 'stdout styling'
    switch $spec
        case ''
            set_color normal
        case header
            chalk black.bgYellow.bold
        case title
            chalk brYellow
        case cmd
            chalk cyan
        case path
            chalk brMagenta.bold
        case rm
            chalk brMagenta.bold.strike
        case url
            chalk blue.underline
        case ok
            chalk brGreen.bold
        case error
            chalk black.bgRed.bold
            # show colors
        case colors
            echo (chalk header) header (chalk)(chalk title) title (chalk)(chalk cmd) cmd (chalk) \
                (chalk path) path (chalk)
            echo (chalk rm) rm (chalk) (chalk url) url (chalk) (chalk ok) ok (chalk) (chalk error) error
        case '*'
            for modifier in (string split . $spec)
                if set -l index (contains -i -- $modifier $_k_colors) # `set` won't modify $status, so this succeeds if `contains` succeeds
                    echo $_v_colors[$index]
                end
            end
    end
end
