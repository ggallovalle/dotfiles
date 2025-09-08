# one time
alias dotnet.server='dotnet watch run'
# migrations
alias dotnet.mi.up='dotnet ef database update'
function dotnet.mi.down() {
    dotnet ef migrations remove --force
}

function dotnet.mi.ls() {
    dotnet ef migrations list --prefix-output | awk '/data/ {print $2}'
}

function dotnet.mi.roll() {
    dotnet ef migrations remove --force
    dotnet ef migrations add InitialMigration
    dotnet ef database update
}

# generate
alias dotnet.g.migration='dotnet ef migrations add'
