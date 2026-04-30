# Docs

[Startup](https://learn.microsoft.com/en-us/powershell/scripting/learn/shell/creating-profiles?view=powershell-7.5)

# Startup programs

- [Startup](https://learn.microsoft.com/en-us/powershell/scripting/learn/shell/creating-profiles?view=powershell-7.5)

```powershell
# get the startup programs
Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
# remove startup program
Remove-ItemProperty -Path  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name OneDrive,Steam,GalaxyClient,GogGalaxy
# add startup program
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "MyStartupApp" -Value "C:\Path\To\YourApp.exe" -PropertyType "String"
```
