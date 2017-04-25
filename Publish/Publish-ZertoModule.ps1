#Script to publish ZertoModule using Chris Lewis' API Key
#MyKey is stored in C:\Scripts\ChrisLewis_NugetKey.txt
$NugetKey = get-content  C:\Scripts\ChrisLewis_NugetKey.txt

#Need to be in C:\Scripts\Zerto
cd C:\Scripts\Zerto

#Build the module
Write-host "Building module"
.\Make-ZertoModule.ps1

#We can only publish from a module path location
Write-Host "Copying module to module directory"
If (-not (Test-Path (Join-Path $env:USERPROFILE '\Documents\WindowsPowerShell\Modules\ZertoModule\') )) 
    { md (Join-Path $env:USERPROFILE '\Documents\WindowsPowerShell\Modules\ZertoModule\') }
Copy-Item C:\Scripts\Zerto\ZertoModule\* (Join-Path $env:USERPROFILE '\Documents\WindowsPowerShell\Modules\ZertoModule\') -Force -Verbose

#Remove and import
Write-Host "Importing Module"
If (Get-Module ZertoModule) { Remove-Module ZertoModule }
Import-Module ZertoModule

#Publish
Write-Host "Publishing Module"
Publish-Module  -Path ZertoModule `
                -NuGetApiKey $NugetKey `
                -Verbose

#Now we have to remove the module from our path since this screws with dev
Write-Host "Removing Module from module path"
If (Test-Path (Join-Path $env:USERPROFILE '\Documents\WindowsPowerShell\Modules\ZertoModule\') ) { rd (Join-Path $env:USERPROFILE '\Documents\WindowsPowerShell\Modules\ZertoModule\') -Recurse }

