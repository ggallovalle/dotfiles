# generic
alias nuget.ru='dotnet run'
# alias dotnet.se='npm search'
alias nuget.h='dotnet -h'
# one time
alias nuget.in='dotnet restore'
# manage dependencies
function nuget.ls() {
    +zinit-message "{info2}Dependencies: {rst}"
    dotnet list package
    +zinit-message "{info2}Dev dependencies: {rst}"
    dotnet tool list
}
alias nuget.ad='dotnet add package'
alias nuget.adD="dotnet tool install"
alias nuget.rm='dotnet remove package'
alias nuget.rmD='dotnet tool uninstall'
