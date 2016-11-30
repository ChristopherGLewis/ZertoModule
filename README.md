# ZertoModule

Powershell Module to wrap the Zerto REST API 

[Zerto Virtual Replication](http://www.zerto.com/) is a hypervisor-based replication product 
designed for creating highly reliable BC/DR replicas.   


## Basic Functionality
This module wraps the  Zerto REST API calls into powershell-friendly cmdlets.  Typical GET requests
return either individual or arrays of Zerto object.

### Typical Usage
Zerto's REST API uses a Zerto session header for the REST calls.  This is mapped to the
ZertoModule call Get-ZertoAuthToken.  Calling Get-ZertoAuthToken prompts for a user/password.    

    $ztoken =  Get-ZertoAuthToken -ZertoServer "zerto1.test.com"


### Supported Zerto Versions

Currently this module support Zerto Virtual Replication 4.5 and 5.0


## Release Notes

**0.8.0** - Initital release to Powershell Gallery.  Note that some functionality, 
specifically around editing VPG settings, has not been implemented.

