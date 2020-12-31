function cl -a chalk -d 'stdout styling'
    switch $chalk
        case ''
            set_color normal
        case header
            cl black.bgYellow.bold
        case title
            cl brYellow
        case cmd
            cl cyan
        case path
            cl brMagenta.bold
        case rm
            cl brMagenta.bold.strike
        case url
            cl blue.underline
        case ok
            cl brGreen.bold
        case error
            cl black.bgRed.bold
            # show colors
        case colors
            echo (cl header) header (cl)(cl title) title (cl)(cl cmd) cmd (cl) \
                (cl path) path (cl)
            echo (cl rm) rm (cl) (cl url) url (cl) (cl ok) ok (cl) (cl error) error
        case '*'
            for modifier in (string split . $chalk)
                if set -l index (contains -i -- $modifier $_k_colors) # `set` won't modify $status, so this succeeds if `contains` succeeds
                    echo $_v_colors[$index]
                end
            end
    end
end
