function load-em --description 'Loads Fish shell function descriptions.'
    # Load function information so it shows up in auto completion
    # @see https://github.com/fish-shell/fish-shell/issues/328#issuecomment-608116177
    # Original from https://github.com/fish-shell/fish-shell/issues/1915#issuecomment-72315918

    for i in (functions | tr , ' ')
        functions $i >/dev/null
    end
end
