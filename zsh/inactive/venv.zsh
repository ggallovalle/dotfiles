function venv.status() {
    if [[ -v PIPENV_ACTIVE ]]; then
        +zinit-message -n "{info2}Inside {nb}pipenv{rst}{info2} located at: "
        +zinit-message "{url}$VIRTUAL_ENV.{rst}"
    elif [[ -v POETRY_ACTIVE ]];then
        +zinit-message -n "{info2}Inside {nb}poetry{rst}{info2} located at: "
        +zinit-message "{url}$VIRTUAL_ENV.{rst}"
    elif [[ -v VIRTUAL_ENV ]];then
        +zinit-message -n "{info2}Inside {nb}pip{rst}{info2} located at: "
        +zinit-message "{url}$VIRTUAL_ENV.{rst}"
    else
        +zinit-message "{failure}You are not in a Python virtualenv.{rst}"
    fi
}


function venv.down() {
    if [[ -v PIPENV_ACTIVE ]]; then
        +zinit-message -n "{success}Exit from {nb}pipenv{rst}{success} located at: "
        +zinit-message "{url}$VIRTUAL_ENV.{rst}"
        exit
    elif [[ -v POETRY_ACTIVE ]];then
        +zinit-message -n "{success}Exit from {nb}poetry{rst}{success} located at: "
        +zinit-message "{url}$VIRTUAL_ENV.{rst}"
        exit
    elif [[ -v VIRTUAL_ENV ]];then
        +zinit-message -n "{success}Exit from {nb}pip{rst}{success} located at: "
        +zinit-message "{url}$VIRTUAL_ENV.{rst}"
        deactivate
    else
        +zinit-message "{failure}You are not in a Python virtualenv.{rst}"
        return 1
    fi
}

alias venv.new='python3 -m venv .env'

function venv.up() {
    local -a py_manager
    PS3='Choose your python package manager: '
    [[ -f Pipfile ]] && py_manager+=(pipenv)
    [[ -f pyproject.toml ]] && py_manager+=(poetry)
    [[ -d env ]] && py_manager+=(pip)
    [[ -d .env ]] && py_manager+=(pip)
    if [ ${#py_manager[@]} -eq 0 ]; then
        +zinit-message "{failure}You are not in a Python project.{rst}"
        return 1
    fi
    select it in ${py_manager[*]};do
    case $it in
        pipenv)
            +zinit-message "{success}{nb}pipenv{rst}{success} activated.{rst}"
            pipenv shell
            return
            ;;
        poetry)
            +zinit-message "{success}{nb}poetry{rst}{success} activated.{rst}"
            poetry shell
            return
            ;;
        pip)
            +zinit-message "{success}{nb}pip{rst}{success} activated.{rst}"
            [[ -d .env ]] && source .env/bin/activate
            [[ -d env ]] && source env/bin/activate
            return
            ;;
        *) +zinit-message "{failure}Invalid option {nb}$REPLY{rst}{failure}.{rst}";;
    esac
    done
}
