complete -c tldr -f -a '(tldr -a -1)'
complete -c tldr -l version -s v -d 'version'
complete -c tldr -l list -s l -d 'list all command for the chosen platform'
complete -c tldr -l list-all -s a -d 'list all commands'
complete -c tldr -l single-column -s 1 -d 'list single command per line'
complete -c tldr -l random -s r -d 'random command'
complete -c tldr -l random-example -s e -d 'random example'
complete -c tldr -l render -s f -d 'render a specific markdown'
complete -c tldr -l markdown -s m -d 'output in markdown format'
complete -f -c tldr -l os -s o -a 'linux osx sunos' -d 'override operating system'
complete -f -c tldr -l linux
complete -f -c tldr -l osx
complete -f -c tldr -l sunos

function __tldr_themes
    echo "
    require 'json'
    parsed = JSON.parse(File.read(ENV['HOME'] + '/.tldrrc'))
    puts parsed['themes'].keys
        " | ruby
end

complete -f -c tldr -l theme -s t -a '(__tldr_themes)' -d 'select theme'
complete -f -c tldr -l search -s s -d 'seach pages using keywords'
complete -f -c tldr -l update -s u -d 'update local cache'
complete -f -c tldr -l clear-cache -s c -d 'clear local cache'
complete -f -c tldr -l help -s h -d 'show help'
