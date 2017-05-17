# ZertoModule

Powershell Module to wrap the Zerto REST API 

[Zerto Virtual Replication](http://www.zerto.com/) is a hypervisor-based replication product 
designed for creating highly reliable BC/DR replicas.   


## Basic Functionality
This module wraps the  Zerto REST API calls into powershell-friendly cmdlets.  Typical GET requests
return either individual or arrays of Zerto object.  Wrapped PUT and POST commands use Powershell 5.0
classes, which are converted into the appropriate json objects for the REST call.

### Setting up your Powershell environment
Download the Zerto Module from the [Powershell Gallery](https://www.powershellgallery.com/packages/ZertoModule) 
using

    Install-Module -Name ZertoModule 

Since Powershell doesn't auto import script modules, you will need to import the 
module using 

    Import-Module ZertoModule

### Authentication
Zerto's REST API uses a Zerto session header for the REST calls.  Connect to the ZertoZVM using:

    Connect-ZertoZVM -ZertoServer "il1zerto.test.com"  -ZertoUser Test\Account

This sets the following Env vars to avoid having to pass them to each command:

    ENV:ZertoServer "il1zerto.test.com" 
    ENV:ZertoPort "9669"
    ENV:ZertoToken {"x-zerto-session":"52a723dd-c288-afbd-b6eb-1e8d299e0c40"} 

You can also connect directly to a Zerto ZVM using `Get-ZertoAuthToken`:

    PS C:\Scripts\Zerto> $ztoken = Get-ZertoAuthToken

This will prompt for a UserName/password.

If you use `Get-ZertoAuthToken`, you will need to pass the returned variable to 
each call:

    Get-ZertoLocalSite -ZertoServer "nc1zerto.test.com" -ZertoPort 9669  -ZertoToken $ztoken

This is useful if you are connecting to multiple ZVMs.

### Basic usage
Once you've used `Connect-ZertoZVM`, any call can be made without specifying the credentials.   
    
    PS C:\Scripts\Zerto> Get-ZertoLocalSite
    
    ContactEmail               : noc@test.com
    ContactName                : NOC
    ContactPhone               : 847-555-1212
    IpAddress                  : 10.75.0.10
    IsReplicationToSelfEnabled : True
    Link                       : @{href=https://10.75.0.10:9669/v1/localsite; identifier=d492497e-6793-4ec8-b44b-f60a43aef445; rel=; type=LocalSiteApi}
    Location                   : Chicago, IL
    SiteIdentifier             : d492497e-6793-4ec8-b44b-f60a43aef445
    SiteName                   : Zerto-IL1
    SiteType                   : VCenter
    UtcOffsetInMinutes         : -360
    Version                    : 5.0.02

You can also specify authentication parameters in your calls:
    
    PS C:\Scripts\Zerto> Get-ZertoLocalSite -ZertoServer "nc1zerto.test.com" -ZertoPort 9669 -ZertoToken (Get-ZertoAuthToken -ZertoServer "nc1zerto.test.com" -ZertoPort 9669 -ZertoUser 'Test\Account')

    ContactEmail               : noc@test.com
    ContactName                : NOC
    ContactPhone               : 847-555-1212
    IpAddress                  : 10.76.0.10
    IsReplicationToSelfEnabled : True
    Link                       : @{href=https://10.76.0.10:9669/v1/localsite; identifier=258fcb39-d6a3-4547-8797-3605da6d372b; rel=; type=LocalSiteApi}
    Location                   : Charlotte, NC
    SiteIdentifier             : 258fcb39-d6a3-4547-8797-3605da6d372b
    SiteName                   : Zerto-NC1
    SiteType                   : VCenter
    UtcOffsetInMinutes         : -240
    Version                    : 5.0.12

### Expired Sessions
Zerto Authentication sessions expire after 30 minutes of no usage.  The error you will see if you try 
to use an expired session looks like this:

    PS C:\Scripts\Zerto> Get-ZertoLocalSite
    Exception occurred in API : Invalid session
    At C:\Scripts\Zerto\ZertoModule\ZertoModule.psm1:871 char:21
    +                     throw $obj.Message
    +                     ~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : OperationStopped: (Exception occur...Invalid session:String) [], RuntimeException
        + FullyQualifiedErrorId : Exception occurred in API : Invalid session

## Supported Zerto Versions

Currently this module support Zerto Virtual Replication 4.5 and 5.0

## Release Notes
**1.0.6** - Updated Get-ZertoVPGStatus to return enum values.

**1.0.5** - Added ZertoTaskStates enum, Get-ZertoTaskState.  Need to dupe this code for othe enums.

**1.0.4** - Added a ":" to "." replace for ZertoTask api.  Tasks returned by Zerto can contain a ":", but the API only uses "."

**1.0.3** - Added $env:ZertoVersion for deprication/new features.  Fixed ResourceReport API.

**1.0.2** - Updated for Zerto 5.0u2 release.

**1.0.1** - Added Connect-ZertoZVM and Disconnect-ZertoZVM.

**1.0.0** - Updated Get/Gets commands.  For example Get-ZertoVPGs and Get-ZertoVPG have been combined 
into Get-ZertoVPG with an ID parameter set.

**0.9.4** - Updated several VPGSettings commands

**0.9.1** - Updated help for 0.9.0, fixed TestNetworkID for Add-ZertoVPG

**0.9.0** - Added ability to specify Failover/Test network ID to Add-ZertoVPG.  Note that this
updated the Failover IP class, so check your New-ZertoFailoverIPAddress calls

**0.8.7** - Fixed some issues with Add-ZertoVRA

**0.8.6** - Fixed some issues with passing ZertoServer/Port/Token to sub-calls'

**0.8.5** - Updated to remove some company information'

**0.8.0** - Initial release to Powershell Gallery.  Note that some functionality, 
specifically around editing VPG settings, has not been implemented.
