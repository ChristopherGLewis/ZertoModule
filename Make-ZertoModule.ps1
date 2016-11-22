New-ModuleManifest ZertoModule\ZertoModule.psd1 `
        -Guid "a7c23e30-0879-42f4-9e1c-bffbe723b02b" `
        -ModuleVersion '0.7.0' `
        -Author 'Chris Lewis' `
        -CompanyName 'Nuveen' `
        -Description 'Zerto REST API Powershell Wrapping module' `
        -RootModule 'ZertoModule.psm1' `
        -FileList 'ZertoModule.psm1-help.xml' `
        -FunctionsToExport '*'  `
        -PowerShellVersion 5.0 `
        -VariablesToExport '*' 
#        -ScriptsToProcess @('ZertoModule.psm1') `
