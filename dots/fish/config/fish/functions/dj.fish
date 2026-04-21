function dj -d 'Django wrapper'
    set -l base (find-up manage.py)
    set -l djangocmd "python manage.py"
    test -z $base; and set djangocmd django-admin
    eval $djangocmd $argv
end
