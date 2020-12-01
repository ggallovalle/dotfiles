alias django='python manage.py'
# TODO: consider django_extensions commands aliases
# https://django-extensions.readthedocs.io/en/latest/command_extensions.html
# one time
alias django.server='python manage.py runserver'
alias django.shell='python manage.py shell'

# migrations
alias django.mi.up='python manage.pyp migrate'
# https://stackoverflow.com/questions/30749363/rolling-back-to-a-previous-migration-in-django
# alias django.mi.down='python manage.pyp migrate:rollback'
alias django.mi.ls='python manage.pyp showmigrations'

# function django.mi.roll() {
#     python manage.pyp migrate:rollback
#     python manage.pyp migrate
# }

# generate
alias django.g.migration='python manage.py makemigrations'
# alias django.g.model='python manage.pyp make:model'
# alias django.g.model.full='python manage.pyp make:model -a'
