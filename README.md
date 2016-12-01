# ZertoModule

Powershell Module to wrap the Zerto REST API 

[Zerto Virtual Replication](http://www.zerto.com/) is a hypervisor-based replication product 
designed for creating highly reliable BC/DR replicas.   


## Basic Functionality
This module wraps the  Zerto REST API calls into powershell-friendly cmdlets.  Typical GET requests
return either individual or arrays of Zerto object.

### Setting up your Powershell environment
Download the Zerto Module from the [Powershell Gallery](https://www.powershellgallery.com/) using

    Install-Module -Name ZertoModule 

If you want, you can import the module using  

    Import-Module ZertoModule

However, it should be auto imported after its installed.

Set the following Env vars to avoid having to pass them to each command:

    PS C:\Scripts\Zerto> Set-Item ENV:ZertoServer "il1zerto.test.com" 
    PS C:\Scripts\Zerto> Set-Item ENV:ZertoPort "9669" 



### Authentication
Zerto's REST API uses a Zerto session header for the REST calls.  You can establish a session with either:

    PS C:\Scripts\Zerto> $ztoken = Get-ZertoAuthToken
Or 

    # Auth with User Name
    PS C:\Scripts\Zerto> Set-ZertoAuthToken -ZertoUser Test\Account

    PS C:\Scripts\Zerto> $Env:ZertoToken
    {"x-zerto-session":"527ffdec-4cb0-eb4c-2067-5488cba47134"}

Both will prompt for a UserName/password.

### Basic usage
Once you've authenticated, any call can be made using the ENV vars.   
    
    PS C:\Scripts\Zerto> Get-ZertoLocalSite
    
    ContactEmail               : noc@test.com
    ContactName                : NOC
    ContactPhone               : 847-555-1212
    IpAddress                  : 10.77.199.10
    IsReplicationToSelfEnabled : True
    Link                       : @{href=https://10.77.199.10:9669/v1/localsite; identifier=d492497e-6793-4ec8-b44b-f60a43aef445; rel=; type=LocalSiteApi}
    Location                   : Chicago, IL
    SiteIdentifier             : d492497e-6793-4ec8-b44b-f60a43aef445
    SiteName                   : Zerto-IL1
    SiteType                   : VCenter
    UtcOffsetInMinutes         : -360
    Version                    : 5.0.0
    
### Expired Sessions
Zerto Authentication sessions expire after 30 minutes of no usage.  The error you will see if you try 
to use an expired session looks like this:

    PS C:\Scripts\Zerto> Get-ZertoLocalSite
    Exception occured in API : Invalid session
    At C:\Scripts\Zerto\ZertoModule\ZertoModule.psm1:871 char:21
    +                     throw $obj.Message
    +                     ~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : OperationStopped: (Exception occur...Invalid session:String) [], RuntimeException
        + FullyQualifiedErrorId : Exception occured in API : Invalid session
  


## Supported Zerto Versions

Currently this module support Zerto Virtual Replication 4.5 and 5.0


## Release Notes

**0.8.0** - Initital release to Powershell Gallery.  Note that some functionality, 
specifically around editing VPG settings, has not been implemented.

