#Requires -Version 5.0
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#NOTE that the ExternalHelp tag requires a BLANK LINE before it 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#region Zerto Enums


    enum ZertoVPGStatus {
        Initializing          = 0
        MeetingSLA            = 1
        NotMeetingSLA         = 2
        HistoryNotMeetingSLA  = 3
        RpoNotMeetingSLA      = 4
        FailingOver           = 5
        Moving                = 6
        Deleting              = 7
        Recovered             = 8
    }

    enum ZertoVPGSubstatus {
        None                                 = 0
        InitialSync                          = 1
        Creating                             = 2
        VolumeInitialSync                    = 3
        Sync                                 = 4
        RecoveryPossible                     = 5
        DeltaSync                            = 6
        NeedsConfiguration                   = 7
        Error                                = 8
        EmptyProtectionGroup                 = 9
        DisconnectedFromPeerNoRecoveryPoints = 10
        FullSync                             = 11
        VolumeDeltaSync                      = 12
        VolumeFullSync                       = 13
        FailingOverCommitting                = 14
        FailingOverBeforeCommit              = 15
        FailingOverRollingBack               = 16
        Promoting                            = 17
        MovingCommitting                     = 18
        MovingBeforeCommit                   = 19
        MovingRollingBack                    = 20
        Deleting                             = 21
        PendingRemove                        = 22
        BitmapSync                           = 23
        DisconnectedFromPeer                 = 24
        ReplicationPausedUserInitiated       = 25
        ReplicationPausedSystemInitiated     = 26
        RecoveryStorageProfileError          = 27
        Backup                               = 28
        RollingBack                          = 29
        RecoveryStorageError                 = 30
        JournalStorageError                  = 31
        VmNotProtectedError                  = 32
    }

    enum ZertoSourceType {
        VCVpg    = 0 
        VCvApp   = 1 
        VCDvApp  = 2 
        AWS      = 3 
        HyperV   = 4 
    }

    enum ZertoTargetType {
        VCVpg    = 0 
        VCvApp   = 1 
        VCDvApp  = 2 
        AWS      = 3 
        HyperV   = 4 
    }

    enum ZertoVPGPriority {
        Low    = 0
        Medium = 1
        High   = 2
    }

    enum ZertoVRAStatus {
        Installed              = 0
        UnsupportedEsxVersion  = 1
        NotInstalled           = 2
        Installing             = 3
        Removing               = 4
        InstallationError      = 5
        HostPasswordChanged    = 6
        UpdatingIpSettings     = 7
        DuringChangeHost       = 8

    }

    enum ZertoPairingStatus {
        Paired = 0 
        Pairing = 1
        Unpaired = 2
    }

    enum ZertoAlertLevel {
        Warning = 0 
        Error = 1
    }

    enum ZertoAlertEntity {
        Zvm                   = 0 
        Vra                   = 1 
        Vpg                   = 2 
        CloudConnector        = 3 
        Storage               = 4 
        License               = 5 
        Zcm                   = 6 
        FileRecoveryComponent = 7 
    }

    enum ZertoAlertHelpIdentifier {
        AWS0001  = 0 
        BCK0001  = 1 
        BCK0002  = 2 
        BCK0005  = 3 
        BCK0006  = 4 
        BCK0007  = 5 
        LIC0001  = 6 
        LIC0002  = 7 
        LIC0003  = 8 
        LIC0004  = 9 
        LIC0005  = 10
        LIC0006  = 11
        LIC0007  = 12
        LIC0008  = 13
        STR0001  = 14
        STR0002  = 15
        STR0004  = 16
        VCD0001  = 17
        VCD0002  = 18
        VCD0003  = 19
        VCD0004  = 20
        VCD0005  = 21
        VCD0006  = 22
        VCD0007  = 23
        VCD0010  = 24
        VCD0014  = 25
        VCD0015  = 26
        VCD0016  = 27
        VCD0017  = 28
        VCD0018  = 29
        VCD0020  = 30
        VCD0021  = 31
        VPG0003 = 32
        VPG0004 = 33
        VPG0005 = 34
        VPG0006 = 35
        VPG0007 = 36
        VPG0008 = 37
        VPG0009 = 38
        VPG0010 = 39
        VPG0011 = 40
        VPG0012 = 41
        VPG0014 = 42
        VPG0015 = 43
        VPG0016 = 44
        VPG0017 = 45
        VPG0018 = 46
        VPG0019 = 47
        VPG0020 = 48
        VPG0021 = 49
        VPG0022 = 50
        VPG0023 = 51
        VPG0024 = 52
        VPG0025 = 53
        VPG0026 = 54
        VPG0027 = 55
        VPG0028 = 56
        VPG0035 = 57
        VPG0036 = 58
        VPG0037 = 59
        VPG0038 = 60
        VPG0039 = 61
        VPG0040 = 62
        VPG0041 = 63
        VPG0042 = 64
        VPG0043 = 65
        VPG0044 = 66
        VPG0045 = 67
        VPG0046 = 68
        VPG0047 = 69
        VPG0048 = 70
        VRA0001 = 71 
        VRA0002 = 72 
        VRA0003 = 73 
        VRA0004 = 74 
        VRA0005 = 75 
        VRA0006 = 76 
        VRA0007 = 77 
        VRA0008 = 78 
        VRA0009 = 79 
        VRA0010 = 80 
        VRA0011 = 81 
        VRA0012 = 82 
        VRA0013 = 83 
        VRA0014 = 84 
        VRA0015 = 85 
        VRA0016 = 86 
        VRA0017 = 87 
        VRA0018 = 88 
        VRA0019 = 89 
        VRA0020 = 90 
        VRA0021 = 91 
        VRA0022 = 92 
        VRA0023 = 93 
        VRA0024 = 94 
        VRA0025 = 95 
        VRA0026 = 96 
        VRA0027 = 97 
        VRA0028 = 98 
        VRA0029 = 99 
        VRA0030 = 100
        VRA0032 = 101
        VRA0035 = 102
        VRA0036 = 103
        VRA0037 = 104
        VRA0038 = 105
        VRA0039 = 106
        VRA0040 = 107
        VRA0049 = 108
        VRA0050 = 109
        VRA0051 = 110
        VRA0052 = 111
        VRA0053 = 112
        VRA0054 = 113
        VRA0055 = 114
        ZCC0001 = 115
        ZCC0002 = 116
        ZCC0003 = 117
        ZCM0001 = 118
        ZVM0001 = 119
        ZVM0002 = 120
        ZVM0003 = 121
        ZVM0004 = 122
        ZVM0005 = 123
        ZVM0006 = 124
        ZVM0007 = 125
        ZVM0008 = 126
        ZVM0009 = 127
        ZVM0010 = 128
        ZVM0011 = 129
        ZVM0012 = 130
        ZVM0013 = 131
        ZVM0014 = 132
        ZVM0015 = 133
        FLR0001 = 134
        Unknown =  135
    }

    enum ZertoEventType {
        Unknown                                    = 0 
        CreateProtectionGroup                      = 1 
        RemoveProtectionGroup                      = 2 
        FailOver                                   = 3 
        FailOverTest                               = 4 
        StopFailOverTest                           = 5 
        Move                                       = 6 
        ProtectVM                                  = 7 
        UnprotectVM                                = 8 
        InstallVra                                 = 9 
        UninstallVra                               = 10
        UpdateProtectionGroup                      = 11
        InsertTaggedCP                             = 12
        HandleMirrorPromotion                      = 13
        ActivateAllMirrors                         = 14
        LogCollection                              = 15
        ForceReconfigurationOfNewVM                = 16
        ClearSite                                  = 17
        ForceRemoveProtectionGroup                 = 18
        ForceUpdateProtectionGroup                 = 19
        ForceKillProtectionGroup                   = 20
        PrePostScript                              = 21
        InitFullSync                               = 22
        Pair                                       = 23
        Unpair                                     = 24
        InstallCloudConnector                      = 25
        UninstallCloudConnector                    = 26
        RedeployCloudConnector                     = 27
        ScriptExecutionFailure                     = 28
        SetAdvancedSiteSettings                    = 29
        Clone                                      = 30
        KeepDisk                                   = 31
        FailoverBeforeCommit                       = 32
        FailoverCommit                             = 33
        FailoverRollback                           = 34
        MoveBeforeCommit                           = 35
        MoveRollback                               = 36
        MoveCommit                                 = 37
        MaintainHost                               = 38
        UpgradeVra                                 = 39
        MoveProtectionGroupToManualOperationNeeded = 40
        ChangeVraIpSettings                        = 41
        PauseProtectionGroup                       = 42
        ResumeProtectionGroup                      = 43
        UpgradeZVM                                 = 44
        BulkUpgradeVras                            = 45
        BulkUninstallVras                          = 46
        AlertTurnedOn                              = 47
        AlertTurnedOff                             = 48
        ChangeVraPassword                          = 49
        ChangeRecoveryHost                         = 50
        BackupProtectionGroup                      = 51
        CleanupProtectionGroupVipDiskbox           = 52
        RestoreProtectionGroup                     = 53
        PreScript                                  = 54
        PostScript                                 = 55
        RemoveVmFromVc                             = 56
        ChangeVraPasswordIpSettings                = 57
        FlrJournalMount                            = 58
        FlrJournalUnmount                          = 59
        Login                                      = 60
    }

    enum ZertoEventCategory {
        All    = 0
        Events = 1
        Alerts = 2
    }

    enum ZertoCommitPolicy {
        Rollback    = 0
        Commit      = 1
        None        = 2
    }

    enum ZertoShutdownPolicy {
        None          = 0
        Shutdown      = 1
        ForceShutdown = 2
    }

    enum ZertoVRAIPConfigType {
        Dhcp = 0
        Static = 1
    }

    enum ZertoTaskTypes {
        CreateProtectionGroup = 0  
        RemoveProtectionGroup = 1  
        FailOver = 2  
        FailOverTest = 3  
        StopFailOverTest = 4  
        Move = 5  
        GetCheckpointList = 6  
        ProtectVM = 7  
        UnprotectVM = 8  
        AddVMToProtectionGroup = 9  
        RemoveVMFromProtectionGroup = 10 
        InstallVra = 11 
        UninstallVra = 12 
        GetVMSettings = 13 
        UpdateProtectionGroup = 14 
        InsertTaggedCP = 15 
        WaitForCP = 16 
        HandleMirrorPromotion = 17 
        ActivateAllMirrors = 18 
        LogCollection = 19 
        ClearCheckpoints = 20 
        ForceReconfigurationOfNewVM = 21 
        ClearSite = 22 
        ForceRemoveProtectionGroup = 23 
        ForceUpdateProtectionGroup = 24 
        ForceKillProtectionGroup = 25 
        PrePostScript = 26 
        InitFullSync = 27 
        Pair = 28 
        Unpair = 29 
        AddPeerVraInfo = 30 
        RemovePeerVraInfo = 31 
        InstallCloudConnector = 32 
        UninstallCloudConnector = 33 
        HandleFirstSyncDone = 34 
        Clone = 35 
        MoveBeforeCommit = 36 
        MoveRollback = 37 
        MoveCommit = 38 
        UpgradeVRA = 39 
        MaintainHost = 40 
        NotSupportedInThisVersion = 41 
        MoveProtectionGroupToManualOperationNeeded = 42 
        FailoverBeforeCommit = 43 
        FailoverCommit = 44 

    }
#endregion

#region Zerto Classes

    class FailoverIPAddress {
        [string] $NICName;
        [bool]   $ReplaceMAC;
        [String] $IPAddress;
        [String] $SubnetMask;
        [String] $Gateway;
        [String] $DNS1;
        [String] $DNS2;
        [String] $DNSSuffix;
        [String] $TestIPAddress;
        [String] $TestSubnetMask;
        [String] $TestGateway;
        [String] $TestDNS1;
        [String] $TestDNS2;
        [String] $TestDNSSuffix;

        #region Base CTOR
        FailoverIPAddress( [String] $NICName, [String] $IPAddress, `
                    [String] $Subnetmask, [String] $Gateway, `
                    [String] $DNS1, [String] $DNS2, `
                    [String] $DNSSuffix) {
            $this.NICName =     $NICName;
            #Should add validation to IP/subnets
            $this.IPAddress =  $IPAddress;
            $this.Subnetmask = $Subnetmask;
            $this.Gateway =    $Gateway;
            $this.DNS1 =       $DNS1;
            $this.DNS2 =       $DNS2;
            $this.DNSSuffix =  $DNSSuffix;
            $this.ReplaceMAC = $false;
        }
        #endregion

        #region CTOR with ReplaceMAC
        FailoverIPAddress( [String] $NICName, [bool] $ReplaceMAC,  `
                    [String] $IPAddress, [String] $Subnetmask, `
                    [String] $Gateway, [String] $DNS1, `
                    [String] $DNS2, [String] $DNSSuffix) {
            $this.NICName =     $NICName;
            #Should add validation to IP/subnets
            $this.IPAddress =  $IPAddress;
            $this.Subnetmask = $Subnetmask;
            $this.Gateway =    $Gateway;
            $this.DNS1 =       $DNS1;
            $this.DNS2 =       $DNS2;
            $this.DNSSuffix =  $DNSSuffix;
            $this.ReplaceMAC = $ReplaceMAC;
        }
        #endregion

        #region CTOR with Test IPs
        FailoverIPAddress(  [String] $NICName, [String] $IPAddress, `
                    [String] $Subnetmask, [String] $Gateway, `
                    [String] $DNS1, [String] $DNS2, `
                    [String] $DNSSuffix, [String] $TestIPAddress, `
                    [String] $TestSubnetMask, [String] $TestGateway, `
                    [String] $TestDNS1, [String] $TestDNS2, `
                    [String] $TestDNSSuffix ) {
            $this.NICName =     $NICName;
            #Should add validation to IP/subnets
            $this.IPAddress =  $IPAddress;
            $this.Subnetmask = $Subnetmask;
            $this.Gateway =    $Gateway;
            $this.DNS1 =       $DNS1;
            $this.DNS2 =       $DNS2;
            $this.DNSSuffix =  $DNSSuffix;
            $this.ReplaceMAC = $false;
            $this.TestIPAddress =  $TestIPAddress;
            $this.TestSubnetMask = $TestSubnetMask;
            $this.TestGateway =    $TestGateway;
            $this.TestDNS1 =       $TestDNS1;
            $this.TestDNS2 =       $TestDNS2;
            $this.TestDNSSuffix =  $TestDNSSuffix;
        }
        #endregion

        #region CTOR with Test IPs & ReplaceMAC
        FailoverIPAddress(  [String] $NICName, [bool] $ReplaceMAC, [String] $IPAddress, `
                    [String] $Subnetmask, [String] $Gateway, `
                    [String] $DNS1, [String] $DNS2, `
                    [String] $DNSSuffix, [String] $TestIPAddress, `
                    [String] $TestSubnetMask, [String] $TestGateway, `
                    [String] $TestDNS1, [String] $TestDNS2, `
                    [String] $TestDNSSuffix ) {
            $this.NICName =     $NICName;
            #Should add validation to IP/subnets
            $this.IPAddress =      $IPAddress;
            $this.Subnetmask =     $Subnetmask;
            $this.Gateway =        $Gateway;
            $this.DNS1 =           $DNS1;
            $this.DNS2 =           $DNS2;
            $this.DNSSuffix =      $DNSSuffix;
            $this.ReplaceMAC =     $ReplaceMAC;
            $this.TestIPAddress =  $TestIPAddress;
            $this.TestSubnetMask = $TestSubnetMask;
            $this.TestGateway =    $TestGateway;
            $this.TestDNS1 =       $TestDNS1;
            $this.TestDNS2 =       $TestDNS2;
            $this.TestDNSSuffix =  $TestDNSSuffix;
        }
        #endregion
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoFailoverIPAddress {
        param (
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto NIC Name')]        [String] $NICName,
            [Parameter(Mandatory=$false, HelpMessage = 'Replace MAC Address')] [Bool]   $ReplaceMAC = $false,
            [Parameter(Mandatory=$true, HelpMessage = 'IP Address')]           [String] $IPAddress,
            [Parameter(Mandatory=$true, HelpMessage = 'Subnet Mask')]          [String] $SubnetMask,
            [Parameter(Mandatory=$true, HelpMessage = 'Gateway')]              [String] $Gateway,
            [Parameter(Mandatory=$true, HelpMessage = 'DNS Server 1')]         [String] $DNS1,
            [Parameter(Mandatory=$true, HelpMessage = 'DNS Server 2')]         [String] $DNS2,
            [Parameter(Mandatory=$true, HelpMessage = 'DNS Domain Suffix')]    [String] $DNSSuffix,

            [Parameter(Mandatory=$false, HelpMessage = 'Test IP Address')]        [String] $TestIPAddress,
            [Parameter(Mandatory=$false, HelpMessage = 'Test Subnet Mask')]       [String] $TestSubnetMask,
            [Parameter(Mandatory=$false, HelpMessage = 'Test Gateway')]           [String] $TestGateway,
            [Parameter(Mandatory=$false, HelpMessage = 'Test DNS Server 1')]      [String] $TestDNS1,
            [Parameter(Mandatory=$false, HelpMessage = 'Test DNS Server 2')]      [String] $TestDNS2,
            [Parameter(Mandatory=$false, HelpMessage = 'Test DNS Domain Suffix')] [String] $TestDNSSuffix
        )
        
        [FailoverIPAddress] $NewZertoIP = [FailoverIPAddress]::new( $NICName, $ReplaceMAC, $IPAddress, $SubnetMask, $Gateway, $DNS1, $DNS2, $DNSSuffix);

        if ($TestIPAddress -or $TestSubnetMask -or $TestGateway -or $TestDNS1 -or $TestDNS2 -or $TestDNSSuffix) {
            if (-not $TestIPAddress -or -not $TestSubnetMask -or -not $TestGateway  `
                -or -not $TestDNS1 -or -not $TestDNS1 -or -not $TestDNS2 -or -not $TestDNSSuffix)  {
                throw "All Test IP settings must be specified if one test setting is specified"
            }
            $NewZertoIP.TestIPAddress = $TestIPAddress
            $NewZertoIP.TestSubnetMask = $TestSubnetMask
            $NewZertoIP.TestGateway = $TestGateway
            $NewZertoIP.TestDNS1 = $TestDNS1
            $NewZertoIP.TestDNS2 = $TestDNS2
            $NewZertoIP.TestDNSSuffix = $TestDNSSuffix
        }
        Return $NewZertoIP    
    }

    class VPGVirtualMachine {
        [string] $VMName;
        [FailoverIPAddress[]] $FailoverIPAddresses;
        #Add other parts of the VPG here

        #region base CTOR
        VPGVirtualMachine ([string] $VMName) {
            $this.VMName = $VMName;
            $this.FailoverIPAddresses = @();
            #Initialize othe parts of the VPG here
        }
        #endregion

        #region CTOR with Addresses
        #VPGVirtualMachine ([string] $VMName, [FailoverIPAddress[]] $FailoverIPAddress ) {
        #    $this.VMName = $VMName;
        #    $this.FailoverIPAddresses = @();
        #    $FailoverIPAddress | ForEach-Object {
        #        $this.FailoverIPAddresses += $_
        #    }
        #}
        #endregion

        AddFailoverIPAddress ([FailoverIPAddress[]] $FailoverIPAddress) {
            $FailoverIPAddress | ForEach-Object {
                $this.FailoverIPAddresses += $_
            }
        }

        #Add methods to add/update other parts of the VPG here
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGVirtualMachine {
        param (
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Name')]     [String] $VMName,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto IPAddresses')]  [FailoverIPAddress[]] $FailoverIPAddress
            #Add other optional vpg components here
        )
        
        [VPGVirtualMachine] $NewZertoVM = [VPGVirtualMachine]::New($VMName);

        if ($FailoverIPAddress)  {
            $NewZertoVM.AddFailoverIPAddress($FailoverIPAddress)
        }
        #Add other optional vpg components Add's here

        Return $NewZertoVM    
    }

    class VRAIPAddressConfig {
            [String] $IPAddress;
            [String] $SubnetMask;
            [String] $Gateway;
            [ZertoVRAIPConfigType] $VRAIPType;

        #region base CTOR
        VRAIPAddressConfig ([String] $IPAddress, [String] $SubnetMask, [String] $Gateway, [ZertoVRAIPConfigType] $VRAIPType) {
            $this.IPAddress = $IPAddress;
            $this.SubnetMask = $SubnetMask;
            $this.Gateway = $Gateway;
            $this.VRAIPType = $VRAIPType;
        }
        #endregion         

    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVRAIPAddressConfig {
        param (
            [Parameter(Mandatory=$true, HelpMessage = 'IP Address')]           [String] $IPAddress,
            [Parameter(Mandatory=$true, HelpMessage = 'Subnet Mask')]          [String] $SubnetMask,
            [Parameter(Mandatory=$true, HelpMessage = 'Gateway')]              [String] $Gateway,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA IP Config Type')] [ZertoVRAIPConfigType] $VRAIPType
        )
        
        [VRAIPAddressConfig] $NewVRAIPAddressConfig = [VRAIPAddressConfig]::new( $IPAddress, $SubnetMask, $Gateway, $VRAIPType);
        Return $NewVRAIPAddressConfig    
    }

    Class ZertoVPGSettingBasic {
        [int] $JournalHistoryInHours; 
        [string] $Name; 
        [string] $Priority; 
        [string] $ProtectedSiteIdentifier; 
        [string] $RecoverySiteIdentifier; 
        [int] $RpoInSeconds; 
        [string] $ServiceProfileIdentifier;
        [int] $TestIntervalInMinutes; 
        [Boolean] $UseWanCompression; 
        [string] $ZorgIdentifier; 

        ZertoVPGSettingBasic([PSCustomObject] $Value) {
            #Validate object?
            $this.JournalHistoryInHours = $Value.JournalHistoryInHours;                                                
            $this.Name = $Value.Name;                   
            $this.Priority = $Value.Priority; 
            $this.ProtectedSiteIdentifier = $Value.ProtectedSiteIdentifier; 
            $this.RecoverySiteIdentifier = $Value.RecoverySiteIdentifier; 
            $this.RpoInSeconds = $Value.RpoInSeconds;                 
            $this.ServiceProfileIdentifier = $Value.ServiceProfileIdentifier; 
            $this.TestIntervalInMinutes = $Value.TestIntervalInMinutes;        
            $this.UseWanCompression = $Value.UseWanCompression;    
            $this.ZorgIdentifier = $Value.ZorgIdentifier; 
        }    
        ZertoVPGSettingBasic([int] $JournalHistoryInHours, [string] $Name, [string] $Priority, [string] $ProtectedSiteIdentifier, [string] $RecoverySiteIdentifier, [int] $RpoInSeconds, [string] $ServiceProfileIdentifier, [int] $TestIntervalInMinutes, [Boolean] $UseWanCompression, [string] $ZorgIdentifier) {
            $this.JournalHistoryInHours = $JournalHistoryInHours; 
            $this.Name = $Name;
            $this.Priority = $Priority;
            $this.ProtectedSiteIdentifier = $ProtectedSiteIdentifier;
            $this.RecoverySiteIdentifier = $RecoverySiteIdentifier;
            $this.RpoInSeconds = $RpoInSeconds;
            $this.ServiceProfileIdentifier = $ServiceProfileIdentifier;
            $this.TestIntervalInMinutes = $TestIntervalInMinutes;
            $this.UseWanCompression = $UseWanCompression;
            $this.ZorgIdentifier = $ZorgIdentifier; 
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBasic {
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Journal in Hrs')] [int] $JournalHistoryInHours, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Name')] [string] $Name, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Priority')] [ZertoVPGPriority] $Priority, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Protected Site Identifier')] [string] $ProtectedSiteIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Protected Site Identifier')] [string] $RecoverySiteIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto RPO in Seconds')] [int] $RpoInSeconds, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Service Profile Identifier')] [string] $ServiceProfileIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Test Interval In Minutes')] [int] $TestIntervalInMinutes, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Use Wan Compression')] [Boolean] $UseWanCompression, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zorg Identifier')] [string] $ZorgIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Basic')] [PSCustomObject] $VPGSettingBasic
        )
        
        if (-not $VPGSettingBasic) {
            [ZertoVPGSettingBasic] $NewObj = [ZertoVPGSettingBasic]::New($JournalHistoryInHours, $Name, $Priority, `
                                                                        $ProtectedSiteIdentifier, $RecoverySiteIdentifier, $RpoInSeconds, `
                                                                        $ServiceProfileIdentifier, $TestIntervalInMinutes, $UseWanCompression, `
                                                                        $ZorgIdentifier );
        } else {
            [ZertoVPGSettingBasic] $NewObj = [ZertoVPGSettingBasic]::New($VPGSettingBasic)
        }

        Return $NewObj
        
    }

    Class ZertoVPGSettingBootgroup {
        [int] $BootDelayInSeconds; 
        [string] $BootGroupIdentifier; 
        [string] $Name;

        ZertoVPGSettingBootgroup([PSCustomObject] $Value) {
            #Validate object?
            $this.BootDelayInSeconds = $Value.BootDelayInSeconds;                                                
            $this.BootGroupIdentifier = $Value.BootGroupIdentifier;
            $this.Name = $Value.Name;                   
        }    
        ZertoVPGSettingBootgroup( [int] $BootDelayInSeconds, [string] $BootGroupIdentifier, [string] $Name ) {
            $this.BootDelayInSeconds = $BootDelayInSeconds;                                                
            $this.BootGroupIdentifier = $BootGroupIdentifier; 
            $this.Name = $Name;                   
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingBootgroup {
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'BootDelayInSeconds')] [int] $BootDelayInSeconds, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Zerto Boot Group Identifier')] [string] $BootGroupIdentifier, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'Name')] [string] $Name, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Bootgroup')] [PSCustomObject] $VPGSettingBootgroup
        )
        
        if (-not $VPGSettingBasic) {
            [ZertoVPGSettingBootgroup] $NewObj = [ZertoVPGSettingBootgroup]::New($BootDelayInSeconds, $BootGroupIdentifier, $Name );
        } else {
            [ZertoVPGSettingBootgroup] $NewObj = [ZertoVPGSettingBootgroup]::New($VPGSettingBootgroup)
        }

        Return $NewObj
        
    }

    Class ZertoVPGSettingJournal{
        [int] $BootDelayInSeconds; 
        [string] $BootGroupIdentifier; 
        [string] $Name;

        ZertoVPGSettingBootgroup([PSCustomObject] $Value) {
            #Validate object?
            $this.BootDelayInSeconds = $Value.BootDelayInSeconds;                                                
            $this.BootGroupIdentifier = $Value.BootGroupIdentifier;
            $this.Name = $Value.Name;                   
        }    
        ZertoVPGSettingBootgroup( [int] $BootDelayInSeconds, [string] $BootGroupIdentifier, [string] $Name ) {
            $this.BootDelayInSeconds = $BootDelayInSeconds;                                                
            $this.BootGroupIdentifier = $BootGroupIdentifier; 
            $this.Name = $Name;                   
        }                 
    }

    Class ZertoVPGSettingJournalLimitation {
        [int] $HardLimitInMB; 
        [int] $HardLimitInPercent; 
        [int] $WarningThresholdInMB;
        [int] $WarningThresholdInPercent;

        ZertoVPGSettingBootgroup([PSCustomObject] $Value) {
            #Validate object?
            $this.HardLimitInMB = $Value.HardLimitInMB;                                                
            $this.HardLimitInPercent = $Value.HardLimitInPercent;                                                
            $this.WarningThresholdInMB = $Value.WarningThresholdInMB;                                                
            $this.WarningThresholdInPercent = $Value.WarningThresholdInPercent;                                                
        }    
        ZertoVPGSettingBootgroup( [int] $HardLimitInMB, [int] $HardLimitInPercent, [int] $WarningThresholdInMB, [int] $WarningThresholdInPercent ) {
            $this.HardLimitInMB = $HardLimitInMB;                                                
            $this.HardLimitInPercent = $HardLimitInPercent;                                                
            $this.WarningThresholdInMB = $WarningThresholdInMB;                                                
            $this.WarningThresholdInPercent = $WarningThresholdInPercent;                    
        }                 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingJournalLimitation {
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'HardLimitInMB')] [int] $HardLimitInMB, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'HardLimitInPercent')] [int] $HardLimitInPercent, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'WarningThresholdInMB')] [int] $WarningThresholdInMB, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'WarningThresholdInPercent')] [int] $WarningThresholdInPercent, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Journal Limitation')] [PSCustomObject] $VPGSettingJournalLimitation
        )
        
        if (-not $VPGSettingJournalLimitation) {
            [ZertoVPGSettingJournalLimitation] $NewObj = [ZertoVPGSettingJournalLimitation]::New($HardLimitInMB, $HardLimitInPercent, $WarningThresholdInMB,  $WarningThresholdInPercent);
        } else {
            [ZertoVPGSettingJournalLimitation] $NewObj = [ZertoVPGSettingJournalLimitation]::New($VPGSettingJournalLimitation)
        }

        Return $NewObj
        
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function New-ZertoVPGSettingJournal {
        param (
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'HardLimitInMB')] [int] $HardLimitInMB, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'HardLimitInPercent')] [int] $HardLimitInPercent, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'WarningThresholdInMB')] [int] $WarningThresholdInMB, 
            [Parameter(Mandatory=$true, ParameterSetName="Individual", HelpMessage  = 'WarningThresholdInPercent')] [int] $WarningThresholdInPercent, 
            [Parameter(Mandatory=$true, ParameterSetName="PSObject", HelpMessage  = 'VPGSetting Journal Limitation')] [PSCustomObject] $VPGSettingJournalLimitation
        )
        
        if (-not $VPGSettingJournalLimitation) {
            [ZertoVPGSettingJournalLimitation] $NewObj = [ZertoVPGSettingJournalLimitation]::New($HardLimitInMB, $HardLimitInPercent, $WarningThresholdInMB,  $WarningThresholdInPercent);
        } else {
            [ZertoVPGSettingJournalLimitation] $NewObj = [ZertoVPGSettingJournalLimitation]::New($VPGSettingJournalLimitation)
        }

        Return $NewObj
        
    }
#endregion

#region Utility Functions
    Function Set-SSLCertByPass  () {
    ################################################
    # Setting certificate exception to prevent authentication issues to the ZVM
    ################################################
    try {
Add-Type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult( ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@ -ErrorAction SilentlyContinue
    } catch {
        Write-Debug $Error[0].Exception.Message 
    }
    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
    }

    Function Get-QueryStringFromHashTable {
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Query String Hash Table')] [Hashtable] $QueryStringHash
        )
        
        $out = ""
        
        $QueryStringHash.keys | ForEach-Object{
            if ($Out.Length -eq 0 ) {
                $Out += "?"
            } else {
                $Out += "&"
            }
            # HTML Encode???
            $Out +=  $_ + "=" +  $QueryStringHash[$_]
        }
        Return $Out
    }

    Function Parse-ZertoDate {
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto Date in the form YYYY-MM-DD or YYYY-MM-DDThh:mm:ss')] [String] $ZertoDate
        )
        
        try {
            $out = [DateTime]::Parse($ZertoDate) | Out-Null
            Return $True
        } catch {
            Return $False
        }
    }

    Function Test-RESTError {
        param (
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Error')] [System.Management.Automation.ErrorRecord] $err
        )
        
        If ($err.Exception -is [System.Net.WebException]) {
            If ($err.Exception.Response.StatusCode.value__  -eq 500) {
                $stream = $err.Exception.Response.GetResponseStream()
                $reader = New-Object System.IO.StreamReader($stream)
                $reader.BaseStream.Position = 0
                $reader.DiscardBufferedData()
                $responseBody = $reader.ReadToEnd();
                $obj = $responseBody | ConvertFrom-Json
                if ($obj.Message) {
                    throw $obj.Message
                } else {
                    throw $obj
                }
            } else {
                throw "Unknown web error: " + $err.Exception.Response.StatusCode.value__ + " : " +  $err.Exception.Response.StatusDescription
            }
        } else {
                throw "Unknown error: " + $err.Exception
        }

    }
#endregion

#region Zerto Authentication

    #.ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAuthToken  {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter( HelpMessage  = 'User to connect to Zerto')] [string] $ZertoUser
        )
        
        Set-SSLCertByPass

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $xZertoSessionURL = $baseURL + "session/add"
        $TypeJSON = "application/json"


        if (  [String]::IsNullOrEmpty($ZertoUser) ) {
            $cred = Get-Credential -Message "Enter your Zerto credentials"
        } else {
            $cred = Get-Credential -Message "Enter your Zerto credentials" -UserName $ZertoUser
        }

        If ($cred -NE $null) {
            # Authenticating with Zerto APIs - Basic AUTH over SSL
            $authInfo = ("{0}\{1}:{2}" -f  $cred.GetNetworkCredential().domain ,  $cred.GetNetworkCredential().UserName,  $cred.GetNetworkCredential().Password )
            $authInfo = [System.Text.Encoding]::UTF8.GetBytes($authInfo)
            $authInfo = [System.Convert]::ToBase64String($authInfo)
            $headers = @{Authorization=("Basic {0}" -f $authInfo)}
            $sessionBody = '{"AuthenticationMethod": "1"}'

            #Need to check our Response.
            try { 
                $xZertoSessionResponse = Invoke-WebRequest -Uri $xZertoSessionURL -Headers $headers -Method POST -Body $sessionBody -ContentType $TypeJSON             
            } catch {
                $xZertoSessionResponse = $_.Exception.Response
            }

            if ($xZertoSessionResponse.StatusCode -eq "200") {
                $xZertoSession = $xZertoSessionResponse.headers.get_item("x-zerto-session")
                $ZertoSessionHeader = @{"x-zerto-session"=$xZertoSession}
                return $ZertoSessionHeader 
            } else {
                if ($xZertoSessionResponse.StatusCode.value__ -eq "401") {
                    Throw "User $ZertoUser not authorized or invalid password."
                }
                return $null
            }
        } else {
            return $null
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoAuthToken  {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "Session" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

#endregion

#region Zerto Rest API


    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoRESTAPIs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        $FullURL = $baseURL 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Alerts

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlerts {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert Start Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $StartDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert End Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $EndDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Identifier')] [string] $VPGIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto ZORG Identifier')] [string] $ZORGIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Site Identifier')] [string] $SiteIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert Level')] [ZertoAlertLevel] $Level, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert Entity')] [ZertoAlertEntity] $Entity, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert HelpIdentifier')] [ZertoAlertHelpIdentifier] $HelpIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts" 
        if ($StartDate -or $EndDate -or $VPGIdentifier -or $ZORGIdentifier -or $SiteIdentifier -or $Level -ne $null  -or $Entity -ne $null -or $HelpIdentifier -ne $null) {
            $qs = [ordered] @{}
            if ($StartDate)        { if (Parse-ZertoDate($StartDate)) { $qs.Add("StartDate", $StartDate) } else { throw "Invalid StartDate: '$StartDate'" } }
            if ($EndDate)          { if (Parse-ZertoDate($EndDate))   { $qs.Add("EndDate",   $EndDate)   } else { throw "Invalid EndDate: '$EndDate'" } }
            if ($VPGIdentifier)    { $qs.Add("VPGIdentifier", $VPGIdentifier) }
            if ($ZORGIdentifier)   { $qs.Add("ZORGIdentifier", $ZORGIdentifier) }
            if ($SiteIdentifier)   { $qs.Add("SiteIdentifier", $SiteIdentifier) }
            if ($Level -ne $null)     { $qs.Add("Level", $Level) }
            if ($Entity -ne $null)     { $qs.Add("Entity", $Entity) }
            if ($HelpIdentifier -ne $null) { $qs.Add("HelpIdentifier", $HelpIdentifier) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlert {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }
            
        $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    function Get-ZertoAlertHelpIdentifierDescription {
        param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto Alert HelpIdentifier')] [ZertoAlertHelpIdentifier] $HelpIdentifier
        )
        switch ($HelpIdentifier){
            AWS0001 { Return "AWS S3 bucket removed" }
            BCK0001 { Return "Offsite backup fails" }
            BCK0002 { Return "Offsite backup fails" }
            BCK0005 { Return "Offsite backup repository disconnected." }
            BCK0006 { Return "Offsite backup repository disconnected." }
            BCK0007 { Return "Offsite backup repository not defined." }
            LIC0001 { Return "License exceeded" }
            LIC0002 { Return "License exceeded" }
            LIC0003 { Return "License about to expire" }
            LIC0004 { Return "License expired and exceeded" }
            LIC0005 { Return "License expired and exceeded" }
            LIC0006 { Return "License expired" }
            LIC0007 { Return "License exceeded" }
            LIC0008 { Return "License exceeded" }
            STR0001 { Return "Datastore not accessible" }
            STR0002 { Return "Datastore full" }
            STR0004 { Return "Datastore low in space" }
            VCD0001 { Return "vCenter Server for the Org vDC is not found" }
            VCD0002 { Return "Org vDC is defined in multiple vCenter Servers" }
            VCD0003 { Return "Org vDC storage profile not found in vCenter Server" }
            VCD0004 { Return "Provider vDC storage profile not found in vCenter Server" }
            VCD0005 { Return "Org vDC network not retrieved" }
            VCD0006 { Return "Provider vDC metadata not found" }
            VCD0007 { Return "Org vDC resource pool not retrieved" }
            VCD0010 { Return "OrgNetwork not retrieved" }
            VCD0014 { Return "vCD disconnection" }
            VCD0015 { Return "AMQP-server disconnection" }
            VCD0016 { Return "Provider vDC datastore not found" }
            VCD0017 { Return "Metadata not accessible" }
            VCD0018 { Return "Duplicated MAC addresses" }
            VCD0020 { Return "VM inconsistency in vApp" }
            VCD0021 { Return "VM inconsistency in vApp" }
            VPG0003 { Return "VPG has low journal history" }
            VPG0004 { Return "VPG has low journal history" }
            VPG0005 { Return "VPG in error state" }
            VPG0006 { Return "VPG missing configuration details" }
            VPG0007 { Return "VPG replication paused" }
            VPG0008 { Return "VPG rollback failed" }
            VPG0009 { Return "VPG target RPO exceeded" }
            VPG0010 { Return "VPG target RPO exceeded" }
            VPG0011 { Return "VPG test overdue" }
            VPG0012 { Return "VPG test overdue" }
            VPG0014 { Return "VPG waiting for commit or rollback" }
            VPG0015 { Return "Resources not enough to support VPG" }
            VPG0016 { Return "Resources pool not found" }
            VPG0017 { Return "VPG protection paused" }
            VPG0018 { Return "VMs in VPG not configured with a storage profile" }
            VPG0019 { Return "VPG recovery storage profile disabled" }
            VPG0020 { Return "VPG recovery storage profile not found" }
            VPG0021 { Return "VPG recovery storage profile not found" }
            VPG0022 { Return "VPG recovery storage profile disabled" }
            VPG0023 { Return "VPG recovery storage profile not found" }
            VPG0024 { Return "VPG recovery storage profile does not include active datastores" }
            VPG0025 { Return "vApp network mapping not defined" }
            VPG0026 { Return "VPG recovery storage profile changed" }
            VPG0027 { Return "VPG includes VMs that are no longer protected" }
            VPG0028 { Return "Corrupted Org vDC network mapping" }
            VPG0035 { Return "VPG protected resources not in ZORG" }
            VPG0036 { Return "VPG recovery resources not in ZORG" }
            VPG0037 { Return "Journal history is compromised" }
            VPG0038 { Return "Journal history is compromised" }
            VPG0039 { Return "RDM has an odd number of blocks" }
            VPG0040 { Return "Virtual machine hardware mismatch with recovery site" }
            VPG0041 { Return "Virtual machine running Windows 2003" }
            VPG0042 { Return "Recovery network not found" }
            VPG0043 { Return "Cross-replication: warning" }
            VPG0044 { Return "Cross-replication: error" }
            VPG0045 { Return "VPG has low journal history: warning" }
            VPG0046 { Return "VPG has low journal history: error" }
            VPG0047 { Return "Journal history is compromised: warning" }
            VPG0048 { Return "Journal history is compromised: error" }
            VRA0001 { Return "Host without VRA" }
            VRA0002 { Return "VRA without IP" }
            VRA0003 { Return "Host IP changes" }
            VRA0004 { Return "VRA lost IP" }
            VRA0005 { Return "VRAs not connected" }
            VRA0006 { Return "Datastore for journal disk is full" }
            VRA0007 { Return "I/O error to journal" }
            VRA0008 { Return "Recovery disk and VMs missing" }
            VRA0009 { Return "Recovery disk missing" }
            VRA0010 { Return "Recovery disks turned off" }
            VRA0011 { Return "Recovery disk inaccessible" }
            VRA0012 { Return "Cannot write to recovery disk" }
            VRA0013 { Return "I/O error to recovery disk" }
            VRA0014 { Return "Cloned disks turned off" }
            VRA0015 { Return "Cloned disk inaccessible" }
            VRA0016 { Return "Datastore for clone disk is full" }
            VRA0017 { Return "I/O error to clone" }
            VRA0018 { Return "Protected disk and VM missing" }
            VRA0019 { Return "Protected disk missing" }
            VRA0020 { Return "VM powered off" }
            VRA0021 { Return "VM disk inaccessible" }
            VRA0022 { Return "VM disk incompatible" }
            VRA0023 { Return "VRA cannot be registered." }
            VRA0024 { Return "VRA removed" }
            VRA0025 { Return "I/O synchronization" }
            VRA0026 { Return "Recovery disk removed" }
            VRA0027 { Return "Journal disk removed" }
            VRA0028 { Return "VRA powered off" }
            VRA0029 { Return "VRA memory low" }
            VRA0030 { Return "Journal size mismatch" }
            VRA0032 { Return "VRA out-of-date" }
            VRA0035 { Return "VRA reconciliation" }
            VRA0036 { Return "For internal use only" }
            VRA0037 { Return "Local MAC Address Conflict" }
            VRA0038 { Return "MAC Address Conflict" } 
            VRA0039 { Return "Journal reached configured limit" }
            VRA0040 { Return "Journal space low" }
            VRA0049 { Return "Host rollback failed" }
            VRA0050 { Return "Wrong host password" }
            VRA0051 { Return "For internal use only" }
            VRA0052 { Return "Disk visible but not recognized" }
            VRA0053 { Return "System disk removed" }
            VRA0054 { Return "" }
            VRA0055 { Return "" }
            ZCC0001 { Return "Zerto Cloud Connector removed" }
            ZCC0002 { Return "Zerto Cloud Connector powered off" }
            ZCC0003 { Return "Orphaned Zerto Cloud Connector" }
            ZCM0001 { Return "No connection to Zerto Virtual Manager" }
            ZVM0001 { Return "No connection to hypervisor manager, such as VMware vCenter Server and Microsoft SCVMM" }
            ZVM0002 { Return "No connection to VRA" }
            ZVM0003 { Return "No connection to site" }
            ZVM0004 { Return "Peer site out-of-date" }
            ZVM0005 { Return "Zerto Virtual Manager space low" }
            ZVM0006 { Return "Upgrade available" }
            ZVM0007 { Return "Cannot upgrade" }
            ZVM0008 { Return "Version mismatch" }
            ZVM0009 { Return "Internal error" }
            ZVM0010 { Return "Synchronization between Zerto Virtual Managers" }
            ZVM0011 { Return "Metadata collection" }
            ZVM0012 { Return "Metadata collection" }
            ZVM0013 { Return "Metadata collection" }
            ZVM0014 { Return "SCSI not found" }
            ZVM0015 { Return "Hyper-V host not accessible" }
            FLR0001 { Return "Files cannot be restored" }
            Unknown { Return "Unknown" }

        
        }
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoAlertDismiss {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoAlertIdentifier)  ) {
            throw "Missing Zerto Alert Identifier"
        }
            
        $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier + "/dismiss"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoAlertUndismiss {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoAlertIdentifier)  ) {
            throw "Missing Zerto Alert Identifier"
        }
            
        $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier + "/undismiss"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlertEntities {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts/entities" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlertHelpIdentifiers {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts/helpidentifiers" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoAlertLevels {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "alerts/levels" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Events

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEvents {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Event Start Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $StartDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Event End Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $EndDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Identifier')] [string] $VPGIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert Entity')] [ZertoEventType] $EventType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Site Name')] [string] $SiteName,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Site Identifier')] [string] $SiteIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto ZORG Identifier')] [ZertoEventType] $ZORGIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert Entity Type')] [ZertoAlertEntity] $EntityType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto User Name')] [string] $UserName,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Event Category')] [ZertoEventCategory] $EventCategory,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "events" 
        if ($StartDate -or $EndDate -or $VPGIdentifier -or $EventType -ne $null -or $SiteName -or $SiteIdentifier -or $ZORGIdentifier `
            -or $EntityType  -ne $null -or $UserName -or $EventCategory -ne $null -or $ZertoAlertIdentifier) {
            $qs = [ordered] @{}
            if ($StartDate)                { if (Parse-ZertoDate($StartDate)) { $qs.Add("StartDate", $StartDate) } else { throw "Invalid StartDate: '$StartDate'" } }
            if ($EndDate)                  { if (Parse-ZertoDate($EndDate))   { $qs.Add("EndDate",   $EndDate)   } else { throw "Invalid EndDate: '$EndDate'" } }
            if ($VPGIdentifier)            { $qs.Add("VPGIdentifier", $VPGIdentifier) }
            if ($EventType -ne $null)      { $qs.Add("EventType", $EventType) }
            if ($SiteName)                 { $qs.Add("SiteName", $SiteName) }
            if ($SiteIdentifier)           { $qs.Add("SiteIdentifier", $SiteIdentifier) }
            if ($EntityType -ne $null)     { $qs.Add("EntityType", $EntityType) }
            if ($ZORGIdentifier)           { $qs.Add("ZORGIdentifier", $ZORGIdentifier) }
            if ($UserName)                 { $qs.Add("UserName", $UserName) }
            if ($EventCategory -ne $null)  { $qs.Add("EventCategory", $EventCategory) }
            if ($ZertoAlertIdentifier)     { $qs.Add("ZertoAlertIdentifier", $ZertoAlertIdentifier) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEvent {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Alert Identifier')] [string] $ZertoAlertIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }
            
        $FullURL = $baseURL + "alerts/" + $ZertoAlertIdentifier
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEventCategories {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "events/categories" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEventEntities {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "Events/entities" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoEventTypes {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "events/types" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Local Site

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoLocalSite {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "localsite"
        Write-Verbose $FullURL
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoLocalSiteID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $ID = Get-ZertoLocalSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                    Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoLocalSitePairingStatuses {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "localsite/pairingstatuses"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Peer Sites

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoPeerSites {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Peer Site name')] [string] $PeerName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Peer Site pairing status')] [ZertoPairingStatus] $ParingStatus, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Peer Site location')] [string] $Location, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Peer Site host name')] [string] $HostName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Peer Site port')] [string] $Port
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "peersites"
        if ($PeerName -or $ParingStatus -ne $null -or $Location -or $HostName -or $Port) {
            $qs = [ordered] @{}
            if ($PeerName)               { $qs.Add("peerName", $PeerName) }
            if ($ParingStatus -ne $null) { $qs.Add("paringStatus", $ParingStatus) }
            if ($Location)               { $qs.Add("location", $Location) }
            if ($HostName)               { $qs.Add("hostName", $HostName) }
            if ($Port)                   { $qs.Add("port", $Port) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoPeerSite {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "peersites/" + $ZertoSiteIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoPeerSiteID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto PeerSite Name')] [string] $ZertoPeerSiteName
        )
        
        $Result = Get-ZertoPeerSites -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.PeerSiteName -eq $ZertoPeerSiteName} | `
                            Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        if ($ID.Count -gt 1) {Throw "$ZertoPeerSiteName returned more than one ID"}

        return $Result
    }
#endregion

#region Zerto Service Profiles
    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoServiceProfiles {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "serviceprofiles"
        if ($Site) {
            $qs = [ordered] @{}
            if ($SiteIdentifier) { $qs.Add("Site", $ZertoSiteIdentifier) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoServiceProfile {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Service Profile Identifier')] [string] $ZertoServiceProfile
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoServiceProfile)  ) {
            throw "Missing Zerto ServciceProfile"
        }

        $FullURL = $baseURL + "serviceprofiles/" + $ZertoServiceProfile
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoServiceProfileID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Site Identifier')] [string] $SiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Service Profile Name')] [string] $ZertoServiceProfileName
        )
        
        $Result = Get-ZertoServiceProfiles -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -SiteIdentifier $SiteIdentifier | `
                            Where-Object {$_.ServiceProfileName -eq $ZertoServiceProfileName} | `
                            Select-Object ServiceProfileIdentifier -ExpandProperty ServiceProfileIdentifier

        if ($ID.Count -gt 1) {Throw "$ZertoServiceProfileName returned more than one ID"}

        return $Result
    }
#endregion

#region Zerto Virtualization Sites

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSites {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )
        
        Return Get-ZertoVirtualizationSites -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSite {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )
        
        Return Get-ZertoVirtualizationSite -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Name')] [string] $ZertoSiteName
        )

        Return Get-ZertoVirtualizationSiteID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteName $ZertoSiteName
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVirtualizationSites {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "virtualizationsites"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVirtualizationSite {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVirtualizationSiteID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Name')] [string] $ZertoSiteName
        )
        
        $Result = Get-ZertoVirtualizationSites -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VirtualizationSiteName -eq $ZertoSiteName} | `
                            Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        if ($ID.Count -gt 1) {Throw "$ZertoSiteName returned more than one ID"}
        
        return $Result
    }

#endregion

#region Zerto Site Secondarys

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastoreClusters {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/datastoreclusters"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastoreClusterID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Datastore Cluster Name')] [string] $DatastoreClusterName
        )

        $ID =  Get-ZertoSiteDatastoreClusters -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier  | `
                            Where-Object {$_.DatastoreClusterName -eq $DatastoreClusterName} | `
                            Select-Object DatastoreClusterIdentifier -ExpandProperty DatastoreClusterIdentifier

        if ($ID.Count -gt 1) {Throw "$DatastoreClusterName returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastores {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/datastores"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteDatastoreID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Datastore Name')] [string] $DatastoreName
        )

        $ID =  Get-ZertoSiteDatastores -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier  | `
                            Where-Object {$_.DatastoreName -eq $DatastoreName} | `
                            Select-Object DatastoreIdentifier -ExpandProperty DatastoreIdentifier

        if ($ID.Count -gt 1) {Throw "$DatastoreName returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteFolders {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/folders"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteFolderID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto vCenter Folder Name')] [string] $FolderName
        )
        
        $ID = Get-ZertoSiteFolders -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier  | `
                            Where-Object {$_.FolderName -match $FolderName } | `
                            Select-Object FolderIdentifier -ExpandProperty FolderIdentifier

        if ($ID.Count -gt 1) {Throw "$FolderName returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHostClusters {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/hostclusters"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHostClusterID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Host Cluster Name')] [string] $HostClusterName
        )
        
        $ID = Get-ZertoSiteHostClusters -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                                Where-Object {$_.VirtualizationClusterName -eq $HostClusterName} | `
                                Select ClusterIdentifier -ExpandProperty ClusterIdentifier

        if ($ID.Count -gt 1) {Throw "$HostClusterName returned more than one ID"}

        return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHosts {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/hosts"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHost {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Host Identifier')] [string] $ZertoHostIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoHostIdentifier)  ) {
            throw "Missing Zerto Host Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/hosts/" + $ZertoHostIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteHostID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Host Name')] [string] $HostName
        )
        
        $ID = Get-ZertoSiteHosts -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                                Where-Object {$_.VirtualizationHostName -eq $HostName} | `
                                Select HostIdentifier -ExpandProperty HostIdentifier

        if ($ID.Count -gt 1) {Throw "$HostName returned more than one ID"}

        return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteNetworks {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/networks"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteNetworkID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'vCenter Network Name')] [string] $NetworkName
        )
        
        $ID =  Get-ZertoSiteNetworks -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                Where-Object {$_.VirtualizationNetworkName -eq $NetworkName} |`
                Select NetworkIdentifier -ExpandProperty NetworkIdentifier

        if ($ID.Count -gt 1) {Throw "$NetworkName returned more than one ID"}

        return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteOrgVCDs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/orgvdcs"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteResourcePools {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/resourcepools"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVApps {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/vapps"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVcdVapps {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/vcdvapps"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVMs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoSiteIdentifier)  ) {
            throw "Missing Zerto Site Identifier"
        }

        $FullURL = $baseURL + "virtualizationsites/" + $ZertoSiteIdentifier + "/vms"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoSiteVMID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Site Identifier')] [string] $ZertoSiteIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Virtual Machine Name')] [string] $VMName
        )
        
        $ID = Get-ZertoSiteVMs -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoSiteIdentifier $ZertoSiteIdentifier | `
                    Where-Object {$_.VmName -eq $VMName } | `
                    Select-Object VmIdentifier -ExpandProperty VmIdentifier

        if ($ID.Count -gt 1) {Throw "$VMName returned more than one ID"}

        return $ID
    }

#endregion

#region Zerto Tasks

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoTasks {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Task Started Before Date (YYYY-MM-DD)')] [string] $StartedBeforeDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Task Started After Date')] [string] $StartedAfterDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Task Completed Before Date (YYYY-MM-DD)')] [string] $CompletedBeforeDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Task Completed After Date')] [string] $CompletedAfterDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Task Type')] [ZertoTaskTypes] $TaskType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Task Status')] [string] $Status
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "tasks"
        if ($StartedBeforeDate -or $StartedAfterDate -or $CompletedBeforeDate -or $CompletedAfterDate -or $TaskType -ne $null -or $Status) {
            $qs = [ordered] @{}
            if ($StartedBeforeDate)   { if (Parse-ZertoDate($StartedBeforeDate))    { $qs.Add("startedBeforeDate",   $StartedBeforeDate)   } else { throw "Invalid StartedBeforeDate: '$StartedBeforeDate'" } }
            if ($StartedAfterDate)    { if (Parse-ZertoDate($StartedAfterDate))     { $qs.Add("startedAfterDate",    $StartedAfterDate)    } else { throw "Invalid StartedAfterDate: '$StartedAfterDate'" } }
            if ($CompletedBeforeDate) { if (Parse-ZertoDate($CompletedBeforeDate))  { $qs.Add("completedBeforeDate", $CompletedBeforeDate) } else { throw "Invalid CompletedBeforeDate: '$CompletedBeforeDate'" } }
            if ($CompletedAfterDate)  { if (Parse-ZertoDate($CompletedAfterDate))   { $qs.Add("completedAfterDate",  $CompletedAfterDate)  } else { throw "Invalid CompletedAfterDate: '$CompletedAfterDate'" } }
            if ($TaskType -ne $null)  { $qs.Add("type", $TaskType) }
            if ($Status)              { $qs.Add("status", $Status) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoTask {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Task Identifier')] [string] $ZertoTaskIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoTaskIdentifier)  ) {
            throw "Missing Zerto Task Identifier"
        }

        $FullURL = $baseURL + "tasks/" + $ZertoTaskIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoTasksTypes {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "tasks/types"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

#endregion

#region Zerto Virtual Machines

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVMs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG name')] [string] $VPGName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM name')] [string] $VMName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Status')] [ZertoVPGStatus] $Status, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Substatus')] [ZertoVPGSubstatus] $SubStatus, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Source Type')] [ZertoSourceType] $SourceType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Target Type')] [ZertoTargetType] $TargetType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Source Site')] [string] $SourceSite, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Target Site')] [string] $TargetSite, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Organization Name')] [string] $OrganizationName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VM Priority')] [ZertoVPGPriority] $Priority
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vms"
        if ($VPGName -or $VMName -or $Status -ne $null -or $Substatus -ne $null -or `
                $SourceType -ne $null -or $TargetType -ne $null -or $SourceSite -or $TargetSite -or $OrganizationName `
                -or $Priority -ne $null) {
            $qs = [ordered] @{}
            if ($VPGName)              { $qs.Add("vpgName", $VPGName) }
            if ($VMName)               { $qs.Add("vmName", $VMName) }
            if ($Status -ne $null)     { $qs.Add("status", $Status) }
            if ($Substatus -ne $null)  { $qs.Add("substatus", $Substatus) }
            if ($SourceType -ne $null) { $qs.Add("sourceType", $SourceType) }
            if ($TargetType -ne $null) { $qs.Add("targetType", $TargetType) }
            if ($SourceSite)           { $qs.Add("sourceSite", $SourceSite) }
            if ($TargetSite)           { $qs.Add("targetSite", $TargetSite) }
            if ($OrganizationName)     { $qs.Add("organizationName", $OrganizationName) }
            if ($Priority -ne $null)   { $qs.Add("priority", $Priority) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVM {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVMIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVMIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

        $FullURL = $baseURL + "vms/" + $ZertoVMIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVMID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Name')] [string] $VmName
        )
        
        $Result = Get-ZertoVMs -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VmName -eq $VmName} | `
                            Select-Object VmIdentifier -ExpandProperty VmIdentifier

        if ($ID.Count -gt 1) {Throw "$VMName returned more than one ID"}

        return $Result
    }
#endregion

#region Zerto VRAs

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Name')] [string] $VRAName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Status')] [ZertoVRAStatus] $VRAStatus,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Version')] [string] $VRAVersion, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Host Version')] [string] $HostVersion, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA IP Address')] [string] $IPAddress, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Group')] [string] $VRAGroup, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Datastore Name')] [string] $DatastoreName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Datastore Cluster Name')] [string] $DatastoreClusterName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VRA Network Name')] [string] $NetworkName 
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "vras" 
        if ($VRAName -or $VRAStatus -ne $null -or $VRAVersion -or $HostVersion -or $IPAddress `
                -or $VRAGroup -or $DatastoreName -or $DatastoreClusterName -or $NetworkName ) {
            $qs = [ordered] @{}
            if ($VRAName)              { $qs.Add("VRAName", $VRAName) }
            if ($VRAStatus -ne $null)  { $qs.Add("Status", $VRAStatus) }
            if ($VRAVersion)           { $qs.Add("VRAVersion", $VRAVersion) }
            if ($HostVersion)          { $qs.Add("HostVersion", $HostVersion) }
            if ($IPAddress)            { $qs.Add("IPAddress", $IPAddress) }
            if ($VRAGroup)             { $qs.Add("VRAGroup", $VRAGroup) }
            if ($DatastoreName)        { $qs.Add("DatastoreName", $DatastoreName) }
            if ($DatastoreClusterName) { $qs.Add("DatastoreClusterName", $DatastoreClusterName) }
            if ($NetworkName)          { $qs.Add("type", $NetworkName) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRA {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VRA Identifier"
        }
            
        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Name')] [string] $VraName
        )

        $ID =  Get-ZertoVRAs -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VraName -eq $VraName} | `
                            Select-Object VraIdentifier -ExpandProperty VraIdentifier

        if ($ID.Count -gt 1) {Throw "$VraName returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAIPConfigurationTypes {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "vras/ipconfigurationtypes" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVRAStatuses {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "vras/statuses" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVRA {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VRA Identifier"
        }
            
        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVRAUpgrade {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VRA Identifier')] [string] $ZertoVraIdentifier
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVraIdentifier)  ) {
            throw "Missing Zerto VRA Identifier"
        }
            
        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier + "/upgrade"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Add-ZertoVRA {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Datastore Name')] [string] $DatastoreName,
            [Parameter(Mandatory=$False, HelpMessage = 'Zerto VRA Group Name (optional)')] [string] $VRAGroupName,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Host Name')] [string] $HostName,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Network Name')] [string] $NetworkName,
            [Parameter(Mandatory=$false, HelpMessage = 'Memory in GB for new VRA (1-16, defaults to 16)')] [string] $MemoryInGB = 16,
            [Parameter(Mandatory=$true, ParameterSetName="Password", HelpMessage = 'Zerto Host Root Password')] [string] $HostRootPassword,
            [Parameter(Mandatory=$true, ParameterSetName="PublicKey", HelpMessage = 'Use vCenter PublicKey instead of Password')] [bool] $UseVCenterPublicKey = $true,
            [Parameter(Mandatory=$true, HelpMessage = 'VRA IP Configuration')] [VRAIPAddressConfig] $VRAIPConfiguration

            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson   
        )
        
        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"
        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        #Validate
        if ($UseVCenterPublicKey -and $HostRootPassword) {
            throw "Cannot specify both HostRootPassword and Use vCenter Public Key"
        }
        if ($MemoryInGB -lt 1 -or $MemoryInGB -gt 16) {
            throw "Invalid MemoryInGB - must be from 1 to 16"
        }  


        #Get Identifiers
        $LocalSiteID = Get-ZertoLocalSiteID -ZertoToken $ztoken
        if ( [string]::IsNullOrEmpty($LocalSiteID)  ) { throw "Could not find Local Site ID" }

        $HostID = Get-ZertoSiteHostID -ZertoToken $ztoken -ZertoSiteIdentifier $LocalSiteID -HostName $HostName
 
        $DatastoreID = Get-ZertoSiteDatastoreID -ZertoToken $ztoken -ZertoSiteIdentifier $LocalSiteID -DatastoreName $DatastoreName

        $NetworkID = Get-ZertoSiteNetworkID  -ZertoToken $ztoken -ZertoSiteIdentifier $LocalSiteID -NetworkName $NetworkName

        #Validate IDs
        if ( [string]::IsNullOrEmpty($DatastoreID)  ) { throw "Could not find Datastore ID for $DatastoreName " }
        if ( [string]::IsNullOrEmpty($HostID)  ) { throw "Could not find Datastore ID for $DatastoreName " }
        if ( [string]::IsNullOrEmpty($NetworkID)  ) { throw "Could not find  Network ID for $NetworkName " }

        $FullURL = $baseURL + "vras/" + $ZertoVraIdentifier 
        Write-Verbose $FullURL

        $NewVRAHash = @{}
        $NewVRAHash.Add("DatastoreIdentifier", $DatastoreID)
        $NewVRAHash.Add("GroupName", $VRAGroupName)
        $NewVRAHash.Add("HostIdentifier", $HostID)
        $NewVRAHash.Add("MemoryInGB", $MemoryInGB)
        $NewVRAHash.Add("NetworkIdentifier", $NetworkID)
        If ($HostRootPassword) {
            $NewVRAHash.Add("HostRootPassword", $HostRootPassword)
        } else {
            $NewVRAHash.Add("HostRootPassword", $null)
        }
        $NewVRAHash.Add("UsePublicKeyInsteadOfCredentials", $UseVCenterPublicKeyNetworkID)
        $NewVRAIPInfo=  @{}
            $NewVRAIPInfo.Add("DefaultGateway", $VRAIPConfiguration.DefaultGateway )
            $NewVRAIPInfo.Add("SubnetMask", $VRAIPConfiguration.SubnetMask )
            $NewVRAIPInfo.Add("VraIPAddress", $VRAIPConfiguration.VraIPAddress )
            $NewVRAIPInfo.Add("VraIPConfigurationTypeApi", $VRAIPConfiguration.VRAIPType.ToString() )
            $NewVRAHash.Add("VraNetworkDataApi", $NewVRAIPInfo)

        #Convert VPG Hash to JSON - Remember DEPTH!!!
        $NewVRAJson = $NewVRAHash | ConvertTo-Json -Depth 20

        Write-Verbose $NewVRAJson

        if ($DumpJson ) {
            #Display JSON, and exit
            Write-host $NewVRAJson
            return
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }


#endregion

#region Zerto VPGs

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Name')] [string] $VPGName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Status')] [ZertoVPGStatus] $Status,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Status')] [ZertoVPGSubStatus] $SubStatus,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Protected Site Type')] [ZertoSourceType] $ProtectedSiteType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Recovery Site Type')] [ZertoSourceType] $RecoverySiteType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Protected Site Identifier')] [string] $ProtectedSiteIdentifier, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Recovery Site Identifier')] [string] $RecoverySiteIdentifier, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Source Site Name')] [string] $SourceSite, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Target Site Name')] [string] $TargetSite, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Source Type')] [ZertoSourceType] $SourceType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Target Type')] [ZertoSourceType] $TargetType, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto ZOrg Name')] [string] $ZOrganizationName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto ZOrg Identifier')] [string] $ZOrgIdentifier, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Priority')] [string] $Priority, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Service Profile Identifier')] [string] $ServiceProfileIdentifier, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Backup Enabled ')] [boolean] $BackupEnabled 
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        
        $FullURL = $baseURL + "vpgs"
        if ($VPGName -or $Status -ne $null -or $SubStatus -ne $null -or $ProtectedSiteType -ne $null `
                -or $RecoverySiteType -ne $null -or $ProtectedSiteIdentifier -or `
                $RecoverySiteIdentifier -or $SourceSite -or $TargetSite -or $SourceType -ne $null `
                -or $TargetType -ne $null -or $ZOrganizationName -or $ZOrgIdentifier `
                -or $priority -ne $null -or $serviceProfileIdentifier -or $backupEnabled ) {
            $qs = [ordered] @{}
            if ($VPGName)                     { $qs.Add("Name", $VPGName) }
            if ($Status -ne $null)            { $qs.Add("Status", $Status) }
            if ($SubStatus -ne $null)         { $qs.Add("SubStatus", $SubStatus) }
            if ($ProtectedSiteType -ne $null) { $qs.Add("ProtectedSiteType", $ProtectedSiteType) }
            if ($RecoverySiteType -ne $null)  { $qs.Add("RecoverySiteType", $RecoverySiteType) }
            if ($ProtectedSiteIdentifier)     { $qs.Add("ProtectedSiteIdentifier", $ProtectedSiteIdentifier) }
            if ($RecoverySiteIdentifier)      { $qs.Add("RecoverySiteIdentifier", $RecoverySiteIdentifier) }
            if ($SourceSite)                  { $qs.Add("SourceSite", $SourceSite) }
            if ($TargetSite)                  { $qs.Add("TargetSite", $TargetSite) }
            if ($SourceType -ne $null)        { $qs.Add("SourceType", $SourceType) }
            if ($TargetType -ne $null)        { $qs.Add("TargetType", $TargetType) }
            if ($ZOrganizationName)           { $qs.Add("ZOrganizationName", $ZOrganizationName) }
            if ($ZOrgIdentifier)              { $qs.Add("ZOrgIdentifier", $ZOrgIdentifier) }
            if ($Priority -ne $null)          { $qs.Add("priority", $Priority) }
            if ($ServiceProfileIdentifier)    { $qs.Add("ServiceProfileIdentifier", $ServiceProfileIdentifier) }
            if ($BackupEnabled)               { $qs.Add("BackupEnabled", $BackupEnabled) }

            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPG {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Convert-ZertoVPGToVPGSetting {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }
        
        $VpgHash = @{}
        $VpgHash.Add("VpgIdentifier", $ZertoVpgIdentifier )
        $VpgHashJson = $VpgHash | ConvertTo-Json


        $FullURL = $baseURL + "vpgSettings" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Body $VpgHashJson -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Name')] [string] $VpgName
        )

        $ID =  Get-ZertoVPGs -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken | `
                            Where-Object {$_.VpgName -eq $VpgName} | `
                            Select-Object VpgIdentifier -ExpandProperty VpgIdentifier

        if ($ID.Count -gt 1) {Throw "$VpgName returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpoints {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Checkpoint Start Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $StartDate, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Checkpoint End Date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)')] [string] $EndDate
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/checkpoints"

        if ($StartDate -or $EndDate ) {
            $qs = [ordered] @{}
            if ($StartDate)      { if (Parse-ZertoDate($StartDate)) { $qs.Add("StartDate", $StartDate) } else { throw "Invalid StartDate: '$StartDate'" } }
            if ($EndDate)        { if (Parse-ZertoDate($EndDate))   { $qs.Add("EndDate",   $EndDate)   } else { throw "Invalid EndDate: '$EndDate'" } }
            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            #[Parameter(Mandatory=$true, ParameterSetName="ID", HelpMessage = 'Zerto Checkpoint ID')] [string] $ZertoVpgCheckpointIdentifier,
            [Parameter(Mandatory=$true, ParameterSetName="Tag", HelpMessage = 'Zerto Checkpoint Tag')] [string] $ZertoVpgCheckpointTag
        )
        
        #if ($ZertoVpgCheckpointIdentifier) {
        #    $ID =  Get-ZertoVPGCheckpoints -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier | `
        #                        Where-Object {$_.CheckpointIdentifier -eq $ZertoVpgCheckpointIdentifier} | `
        #                        Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier
        #} elseif ($ZertoVpgCheckpointTag) {
            $ID =  Get-ZertoVPGCheckpoints -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier | `
                                Where-Object {$_.Tag -eq $ZertoVpgCheckpointTag} | `
                                Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier
        #}

        if ($ID.Count -gt 1) {Throw "$ZertoVpgCheckpointTag returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointLastID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )
        
        $ID = (Get-ZertoVPGCheckpoints -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier)[-1] | 
                            Select-Object CheckpointIdentifier -ExpandProperty CheckpointIdentifier

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGCheckpointSummary {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/checkpoints/Summary"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGEntityTypes {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/entitytypes"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGFailoverCommitPolicies {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/failovercommitpolicies"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGFailoverShutdownPolicies {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/failovershutdownpolicies"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGPriorities {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/priorities"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGRetentionPolicies {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/retentionpolicies"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGStatuses {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/statuses"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSubstatuses {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgs/substatuses"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Add-ZertoVPG {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,

            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Name')] [string] $VPGName, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Priority')] [ZertoVPGPriority] $Priority, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Recovery Site Name')] [string] $RecoverySiteName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto RPO Alert in seconds')] [ValidateRange(0,99999)]  [int] $RPOAlertInSeconds = 300, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Test Interval in minutes')] [ValidateRange(0,9999999)] [int] $TestIntervalInMinutes = 262080, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Cluster Name')] [string] $ClusterName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Host Name')] [string] $HostName, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Failover Network')] [string] $FailoverNetwork, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Test Network')] [string] $TestNetwork, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Datastore Name')] [string] $DatastoreName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Datastore Cluster Name')] [string] $DatastoreclusterName, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Journal Datastore Name')] [string] $JournalDatastoreName, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Journal History In Hours')] [ValidateRange(0,9999)] [int] $JournalHistoryInHours = 24, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Journal Hard Limit in MB')] [ValidateRange(0,9999999)] [int] $JournalHardLimitMB = 153600, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Journal Warning Threshold in MB')] [ValidateRange(0,9999999)] [int] $JournalWarningThresholdMB = 115200, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto vCenter Folder')] [string] $vCenterFolder,

            [Parameter(Mandatory=$true, ParameterSetName="VMNames",  HelpMessage = 'Zerto Virtual Machine names')] [string[]] $VmNames,
            [Parameter(Mandatory=$true, ParameterSetName="VMClass", HelpMessage = 'Zerto VPG Virtual Machine class')] [VPGVirtualMachine[]] $VPGVirtualMachines

            ,[Parameter(Mandatory=$false, HelpMessage = 'Commit this Zerto VPG')] [bool] $VPGCommit = $true
            ,[Parameter(Mandatory=$false, HelpMessage = 'Dump Json without posting for debug')] [switch] $DumpJson


        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($VPGName)  ) { throw "Missing Zerto VPG Name" }
        if ( [string]::IsNullOrEmpty($Priority)  ) { throw "Missing Zerto Priority" }

        if ($HostName -and $ClusterName) {throw "Cannot specify both Host Name and Cluster Name"}
        if (-not $HostName -and -not $ClusterName) {throw "Must specify either Host Name or Cluster Name"}

        if ($DatastoreName -and $DatastoreclusterName) {throw "Cannot specify both Datastore Name and Datastore Cluster Name"}
        if (-not $DatastoreName -and -not $DatastoreclusterName) {throw "Must specify either Datastore Name or Datastore Cluster Name"}

        if ( $VmNames.Count -lt 1 -and $VmNamesAndIPAddresses.Count -lt 1 ) { throw "Must specify at least one VM Name "}

        #Get Identifiers
        $LocalSiteID = Get-ZertoLocalSiteID -ZertoToken $ztoken

        $RecoverySiteID = Get-ZertoVirtualizationSiteID -ZertoToken $ztoken -ZertoSiteName $RecoverySiteName

        $FailoverNetworkID = Get-ZertoSiteNetworkID  -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -NetworkName $FailoverNetwork

        $TestNetworkID = Get-ZertoSiteNetworkID  -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -NetworkName $TestNetwork

        if ($ClusterName) {
            $ClusterID = Get-ZertoSiteHostClusterID -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -HostClusterName $ClusterName
            $HostID = $null
        } elseif ($HostName) {
            $ClusterID = $null
            $HostID = Get-ZertoSiteHostID -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -HostName $HostName
        }

        #BROKEN
        #$ServiceProfileID = Get-ZertoServiceProfiles -ZertoToken $ztoken  | `
        #                    Where-Object {$_.Description -match $ServiceProfile} | `
        #                    Select-Object SiteIdentifier -ExpandProperty SiteIdentifier

        if ($DatastoreName) {
            $DatastoreID = Get-ZertoSiteDatastoreID -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -DatastoreName $DatastoreName
            $DatastoreClusterID = $null
        } elseif ($DatastoreClusterName) {
            $DatastoreID = $null
            $DatastoreClusterID = Get-ZertoSiteDatastoreClusterID -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -DatastoreClusterName $DatastoreclusterName
        }

        $JournalDatastoreID = Get-ZertoSiteDatastoreID -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -DatastoreName  $JournalDatastoreName 

        $FolderID = Get-ZertoSiteFolderID -ZertoToken $ztoken -ZertoSiteIdentifier $RecoverySiteID -FolderName $vCenterFolder

        #Save our VMID in a VMName/ID Hash
        $VMNameAndIDHash = [ordered] @{}
        if ($VmNames) {
            $VmNames | ForEach-Object  {
                #VM's are always from LocalSite
                $VMID =  Get-ZertoSiteVMID -ZertoToken $ztoken -ZertoSiteIdentifier $LocalSiteID -VMName $_ 
                $VMNameAndIDHash.Add($_, $VMID)
        }
        } elseif ($VmNamesAndIPAddresses) {
            $VmNamesAndIPAddresses | ForEach-Object  {
                #VM's are always from LocalSite
                $VMID =  Get-ZertoSiteVMID -ZertoToken $ztoken -ZertoSiteIdentifier $LocalSiteID -VMName $_.VMName 
                $VMNameAndIDHash.Add($_.VMName , $VMID)
            }
        } else {
            throw "No VM's specified"
        }

        #Validate IDs
        if ( [string]::IsNullOrEmpty($LocalSiteID)  ) { throw "Could not find Local Site ID" }
        if ( [string]::IsNullOrEmpty($RecoverySiteID)  ) { throw "Could not find Recovery Site ID for $RecoverySiteName " }
        if ( [string]::IsNullOrEmpty($FailoverNetworkID)  ) { throw "Could not find Failover Network ID for $FailoverNetwork " }
        if ( [string]::IsNullOrEmpty($TestNetworkID)  ) { throw "Could not find Test Network ID for $TestNetwork " }
        if ($ClusterName) {
            if ( [string]::IsNullOrEmpty($ClusterID)  ) { throw "Could not find Cluster ID for $ClusterName " }
        }
        if ($HostName) {
            if ( [string]::IsNullOrEmpty($HostID)  ) { throw "Could not find Host ID for $HostName " }
        }
        if ($DatastoreName) {
            if ( [string]::IsNullOrEmpty($DatastoreID)  ) { throw "Could not find Datastore ID for $DatastoreName " }
        }
        if ($DatastoreclusterName) {
            if ( [string]::IsNullOrEmpty($DatastoreClusterID)  ) { throw "Could not find Datastore Cluster ID for $DatastoreclusterName " }
        }

        if ( [string]::IsNullOrEmpty($JournalDatastoreID)  ) { throw "Could not find Journal Datastore ID for $JournalDatastoreName " }
        if ( [string]::IsNullOrEmpty($FolderID)  ) { throw "Could not find Folder ID for $vCenterFolder " }

        if ( $RecoverySiteID.Count -gt 1 ) { throw "More than one Recovery site has the name $RecoverySiteName " }
        if ( $FailoverNetworkID.Count -gt 1 ) { throw "More than one Failover Network ID has the name $FailoverNetwork " }
        if ( $TestNetworkID.Count -gt 1 ) { throw "More than one Test Network ID has the name $TestNetwork " }
        if ($ClusterName) {
            if ( $ClusterID.Count -gt 1 ) { throw "More than one Cluster ID has the name $ClusterName " }
        } elseif ($HostName) {
            if ( $HostID.Count -gt 1 ) { throw "More than one Host ID has the name $HostName  " }
        }    
        
        if ($DatastoreName) {
            if ( $DatastoreID.Count -gt 1 ) { throw "More than one Datastore ID has the name $DatastoreName " }
        } elseif ($DatastoreClusterName) {
            if ( $DatastoreClusterID.Count -gt 1 ) { throw "More than one Datastore Cluster ID has the name $DatastoreclusterName " }
        }
        if ( $JournalDatastoreID.Count -gt 1 ) { throw "More than one Journal Datastore ID has the name $JournalDatastoreName " }
        if ( $FolderID.Count -gt 1 ) { throw "More than one Folder ID has the name $vCenterFolder " }


        #Build up our json object
        $NewVPGHash = [ordered] @{}
        $NewVPGHash.Add('Backup' , $null)
        $Basic = [ordered] @{}
            $Basic.Add( 'JournalHistoryInHours', $JournalHistoryInHours)
            $Basic.Add( 'Name', $VPGName)
            $Basic.Add( 'Priority', $Priority.ToString() )
            $Basic.Add( 'ProtectedSiteIdentifier', $LocalSiteID)
            $Basic.Add( 'RecoverySiteIdentifier', $RecoverySiteID )
            $Basic.Add( 'RpoInSeconds', $RPOAlertInSeconds)
            $Basic.Add( 'ServiceProfileIdentifier', $null )
            $Basic.Add( 'TestIntervalInMinutes', $TestIntervalInMinutes )
            $Basic.Add( 'UseWanCompression', $true )
            $Basic.Add( 'ZorgIdentifier', $null )
            $NewVPGHash.Add('Basic' , $Basic)
        $BootGroupsItem = [ordered] @{}
            $BootGroupsItem.Add( 'BootDelayInSeconds', 0)
            $BootGroupsItem.Add( 'BootGroupIdentifier', '00000000-0000-0000-0000-000000000000')
            $BootGroupsItem.Add( 'Name', 'Default')
            $BootGroupsArray = @()
            $BootGroupsArray += $BootGroupsItem
            $BootGroups= @{'BootGroups' = $BootGroupsArray }
            $NewVPGHash.Add('BootGroups' , $BootGroups )
        $Journal = [ordered] @{}
            if ($DatastoreClusterID) {
                $Journal.Add( 'DatastoreClusterIdentifier', $DatastoreClusterID)
                $Journal.Add( 'DatastoreIdentifier', $null)
            }
            if ($DatastoreID) {
                $Journal.Add( 'DatastoreClusterIdentifier', $null)
                $Journal.Add( 'DatastoreIdentifier', $DatastoreID)
            }
                $JournalLimit = [ordered] @{}
                $JournalLimit.Add( 'HardLimitInMB', $JournalHardLimitMB )
                $JournalLimit.Add( 'HardLimitInPercent', $null )
                $JournalLimit.Add( 'WarningThresholdInMB', $JournalWarningThresholdMB )
                $JournalLimit.Add( 'WarningThresholdInPercent', $null )
            $Journal.Add( 'Limitation', $JournalLimit)
            $NewVPGHash.Add('Journal' , $Journal )
        $Networks = [ordered] @{}
                $Failover = [ordered] @{}
                    $DefaultNetworkIdentifier = [ordered] @{}
                    $DefaultNetworkIdentifier.Add('DefaultNetworkIdentifier', $FailoverNetworkID)
                    $Failover.Add( 'Hypervisor', $DefaultNetworkIdentifier )
            $Networks.Add( 'Failover', $Failover)
                $FailoverTest = [ordered] @{}
                    $DefaultNetworkIdentifier = [ordered] @{}
                    $DefaultNetworkIdentifier.Add('DefaultNetworkIdentifier', $TestNetworkID)
                $FailoverTest.Add( 'Hypervisor', $DefaultNetworkIdentifier )
            $Networks.Add( 'FailoverTest', $FailoverTest)
            $NewVPGHash.Add('Networks' , $Networks )
        $Recovery = [ordered] @{}
            $Recovery.Add( 'DefaultDatastoreIdentifier', $DatastoreID)
            $Recovery.Add( 'DefaultFolderIdentifier', $FolderID)
            if ($ClusterID) {
                $Recovery.Add( 'DefaultHostClusterIdentifier', $ClusterID)
                $Recovery.Add( 'DefaultHostIdentifier', $null)
            } else {
                $Recovery.Add( 'DefaultHostClusterIdentifier', $null)
                $Recovery.Add( 'DefaultHostIdentifier', $HostID)
            }
            $Recovery.Add( 'ResourcePoolIdentifier', $null)
            $NewVPGHash.Add( 'Recovery' , $Recovery )
        $Scripting = [ordered] @{}
            $Scripting.Add( 'PostBackup', $null)
                $PostRecovery = [ordered] @{}
                $PostRecovery.Add( 'Command', $null)
                $PostRecovery.Add( 'Parameters', $null)
                $PostRecovery.Add( 'TimeoutInSeconds', 0)
            $Scripting.Add( 'PostRecovery', $PostRecovery)
                $PreRecovery = [ordered] @{}
                $PreRecovery.Add( 'Command', $null)
                $PreRecovery.Add( 'Parameters', $null)
                $PreRecovery.Add( 'TimeoutInSeconds', 0)
            $Scripting.Add( 'PreRecovery', $PreRecovery)               
            $NewVPGHash.Add( 'Scripting' , $Scripting )
        $VMArray= @()
            if ($VmNames) {
                #This section is VM + ID only
                if ($VMNameAndIDHash.Keys.Count -gt 0) { 
                    $VMNameAndIDHash.Keys |  ForEach-Object {
                        $VMArray += @{ 'VmIdentifier' =  $VMNameAndIDHash[$_] }
                    }
                }
            } elseif ($VPGVirtualMachines) {
                $VPGVirtualMachines | ForEach-Object {
                    #region VM Foreach
                    $NewVmHash = [ordered] @{}
                        #Lookup ID from $VMNameAndIDHash
                        $NewVmHash.Add('VmIdentifier' , $VMNameAndIDHash[$_.VMName] )
                        #Loop through our NICs
                        $AllNics = @()
                        $_.FailoverIPAddresses | ForEach-Object {
                            $Nic = [ordered] @{}
                                $Nic.Add( "NicIdentifier" , $_.NicName)
                                $NicFail = [ordered] @{}
                                    $NicFailHyper = [ordered] @{}
                                        $NicFailHyper.Add("DnsSuffix", $_.DnsSuffix)
                                            $NicFailHyperIP = [ordered] @{}
                                            $NicFailHyperIP.Add("Gateway", $_.Gateway)
                                            $NicFailHyperIP.Add("IsDhcp", $false)
                                            $NicFailHyperIP.Add("PrimaryDns", $_.Dns1)
                                            $NicFailHyperIP.Add("SecondaryDns", $_.Dns2)
                                            $NicFailHyperIP.Add("StaticIp", $_.IPAddress)
                                            $NicFailHyperIP.Add("SubnetMask", $_.SubnetMask)
                                        $NicFailHyper.Add("IpConfig", $NicFailHyperIP)
                                        $NicFailHyper.Add( "ShouldReplaceMacAddress" , $_.ReplaceMAC)
                                    $NicFail.Add( "Hypervisor", $NicFailHyper)
                                #Add Failover to NIC
                                $Nic.Add("Failover", $NicFail)
                            If ($_.TestIPAddress) {
                                $NicTest = [ordered] @{}
                                    $NicTestHyper = [ordered] @{}
                                        $NicTestHyper.Add("DnsSuffix", $_.TestDnsSuffix)
                                            $NicTestHyperIP = [ordered] @{}
                                            $NicTestHyperIP.Add("Gateway", $_.TestGateway)
                                            $NicTestHyperIP.Add("IsDhcp", $false)
                                            $NicTestHyperIP.Add("PrimaryDns", $_.TestDns1)
                                            $NicTestHyperIP.Add("SecondaryDns", $_.TestDns2)
                                            $NicTestHyperIP.Add("StaticIp", $_.TestIPAddress)
                                            $NicTestHyperIP.Add("SubnetMask", $_.TestSubnetMask)
                                        $NicTestHyper.Add("IpConfig", $NicTestHyperIP)
                                        #$NicTestHyper.Add( "NetworkIdentifier" , '00000000-0000-0000-0000-000000000000')
                                        $NicTestHyper.Add( "ShouldReplaceMacAddress" , $_.ReplaceMAC)
                                    $NicTest.Add("Hypervisor", $NicTestHyper)
                                #Add Failover Test to NIC
                                $Nic.Add("FailoverTest", $NicTest)
                            }
                        
                            $AllNics += $Nic
                        }  #end of foreach $_.FailoverIPAddresses 
                        $NewVmHash.Add('Nics', $AllNics )
                    #Add this VM Hash to the VMArray
                    $VMArray += $NewVmHash
                    #endregion
                }
            } else {
                throw "No VM's specified"
            }
            $NewVPGHash.Add( 'Vms' , $VMArray)
        
        #
        #Convert VPG Hash to JSON - Remember DEPTH!!!
        $NewVPGJson = $NewVPGHash | ConvertTo-Json -Depth 20

        $FullURL = $baseURL + "vpgsettings"
        Write-Verbose $FullURL
        Write-Verbose $NewVPGJson
        
        if ($DumpJson ) {
            #Display JSON, and exit
        Write-host $NewVPGJson
        return
        }

        #This POST creates the settings
        $VPGSettingsID = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $NewVPGJson
        Write-Verbose $VPGSettingsID

        $VPGSetting = Get-ZertoVPGSetting -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgSettingsIdentifier $VPGSettingsID
        if ( $VPGSetting -eq $null ) { throw "Error creating VPG" }

        Write-Verbose  $VPGSetting

        if (-not $VPGCommit) {
            Write-Host "VPG Setting $VPGSettingsID created.  Commit with '" -NoNewline -ForegroundColor Red
            write-host "Commit-ZertoVPGSetting -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgSettingsIdentifier $VPGSettingsID" -ForegroundColor Cyan -NoNewline
            Write-Host "'" -ForegroundColor Red
            return $Result 
        }

        $Result = Commit-ZertoVPGSetting -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgSettingsIdentifier $VPGSettingsID
        return $Result 

    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPG {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Force Remove')] [Bool] $Force = $false,
            [Parameter(Mandatory=$false, HelpMessage = 'Keep Recovery Volumes')] [Bool] $KeepRecoveryVolumes = $false
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier
        Write-Verbose $FullURL

        $BodyHash = [ordered] @{}
        $BodyHash.Add("Force", $Force)
        $BodyHash.Add("KeepRecoveryVolumes", $KeepRecoveryVolumes)
        $Body = $BodyHash | ConvertTo-Json
        Write-Verbose $FullURL
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGForceSync {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/forcesync"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Start-ZertoVPGClone {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Checkpoint Identifier (default is latest)')] [string] $ZertoVpgCheckpointIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/Clonestart"
        Write-Verbose $FullURL
        
        if ($ZertoVpgCheckpointIdentifier) {
            $BodyHash = [ordered] @{}
            $BodyHash.Add("checkpointIdentifier", $ZertoVpgCheckpointIdentifier)
            $Body = $BodyHash | ConvertTo-Json
            Write-Verbose $Body
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Stop-ZertoVPGClone {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/CloneAbort"
        Write-Verbose $FullURL
        
        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Start-ZertoVPGFailover {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Checkpoint Identifier (default is latest)')] [string] $ZertoVpgCheckpointIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Commit Policy')] [ZertoCommitPolicy] $CommitPolicy = "Commit",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Commit Value in seconds')] [string] $CommitInSeconds,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Shutdown Policy')] [ZertoShutdownPolicy] $ShutdownPolicy = "Shutdown",
            [Parameter(Mandatory=$true, HelpMessage = 'Time to wait before shutdown in seconds')] [string] $TimeToWaitBeforeShutdownInSec
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/Failover"
        Write-Verbose $FullURL
        
        $BodyHash = [ordered] @{}
        if ($ZertoVpgCheckpointIdentifier) {
            $BodyHash.Add("CheckpointIdentifier", $ZertoVpgCheckpointIdentifier )
        } else {
            $BodyHash.Add("CheckpointIdentifier", (Get-ZertoVPGCheckpointLastID -ZertoServer $ZertoServer -ZertoPort $ZertoPort -ZertoToken $ZertoToken -ZertoVpgIdentifier $ZertoVpgIdentifier )  )
        }
        $BodyHash.Add("CommitPolicy", $CommitPolicy )
        #$Failover.Add("CommitValue", $CommitInSeconds)
        $BodyHash.Add("ShutdownPolicy", $ShutdownPolicy )
        $BodyHash.Add("TimeToWaitBeforeShutdownInSec", $TimeToWaitBeforeShutdownInSec )
        $Body = $BodyHash | ConvertTo-Json
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGFailoverCommit {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/failovercommit" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGFailoverRollback {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/failoverRollback" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Start-ZertoVPGFailoverTest {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto VPG Checkpoint Identifier')] [string] $ZertoVpgCheckpointIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/FailoverTest"
        Write-Verbose $FullURL
        
        if ($ZertoVpgCheckpointIdentifier) {
            $BodyHash = [ordered] @{}
            $BodyHash.Add("checkpointIdentifier", $ZertoVpgCheckpointIdentifier)
            $Body = $BodyHash | ConvertTo-Json
            Write-Verbose $Body
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Stop-ZertoVPGFailoverTest {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoVpgIdentifier,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Failover Test success status')] [string] $FailoverTestSuccess = $true,
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Failover Test result summary')] [string] $FailoverTestSummary
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/FailoverTestStop"
        Write-Verbose $FullURL
        
        if ($ZertoVpgCheckpointIdentifier) {
            $BodyHash = [ordered] @{}
            $BodyHash.Add("FailoverTestSuccess", $FailoverTestSuccess)
            $BodyHash.Add("FailoverTestSummary", $FailoverTestSummary)
            $Body = $BodyHash | ConvertTo-Json
            Write-Verbose $Body
        }

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Post -Body $Body
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGPause {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/pause" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Invoke-ZertoVPGResume {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG  Identifier')] [string] $ZertoVpgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgIdentifier)  ) {
            throw "Missing Zerto VPG  Identifier"
        }

        $FullURL = $baseURL + "vpgs/" + $ZertoVpgIdentifier + "/resume" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }
#endregion

#region Zerto VPG Settings

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettings {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "vpgSettings"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSetting {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingID {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Setting Name')] [string] $VpgSettingName
        )

        $ID =  Get-ZertoVPGSettings -ZertoToken $ztoken | `
                            Where-Object {$_.Basic.Name -eq $VpgSettingName} | `
                            Select-Object VpgSettingsIdentifier -ExpandProperty VpgSettingsIdentifier

        if ($ID.Count -gt 1) {Throw "$VpgSettingName returned more than one ID"}

        Return $ID
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Commit-ZertoVPGSetting {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/commit" 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method POST
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Remove-ZertoVPGSetting {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier 
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Delete
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackup {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackupDayOfWeek {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup/dayofweek"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackupRetentionPeriod {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup/retentionperiod"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBackupSchedulerPeriod {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/backup/schedulerperiod"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBasic {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/basic"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Set-ZertoVPGSettingBasic {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Basic block')] [ZertoVPGSettingBasic] $ZertoVpgSettingBasic
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/basic"
        Write-Verbose $FullURL
        $Body = $ZertoVpgSettingBasic | ConvertTo-Json -Depth 5
        Write-Verbose $Body

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON -Method Put -Body $Body 
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingBootGroup {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/bootgroup"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingJournal {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/journal"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingNetworks {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/networks"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingPriority {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/priority"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingRecovery {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/recovery"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingScripting {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/scripting"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVM {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMNICs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMNIC {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoNicIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoNicIdentifier)  ) {
            throw "Missing Zerto NIC Identifier"
        }
        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics/" + $ZertoNicIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMVolumes {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }

        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/volumes"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoVPGSettingVMVolume {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Settings Identifier')] [string] $ZertoVpgSettingsIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVmIdentifier,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VM Identifier')] [string] $ZertoVolumeIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoVpgSettingsIdentifier)  ) {
            throw "Missing Zerto VPG Settings Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoVmIdentifier)  ) {
            throw "Missing Zerto VM Identifier"
        }
        if ( [string]::IsNullOrEmpty($ZertoVolumeIdentifier)  ) {
            throw "Missing Zerto Volume Identifier"
        }
        $FullURL = $baseURL + "vpgSettings/" + $ZertoVpgSettingsIdentifier + "/vms/" + $ZertoVmIdentifier + "/nics/" + $ZertoVolumeIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result 
    }
#endregion

#region Zerto ZOrgs

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoZOrgs {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        $FullURL = $baseURL + "zorgs"
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoZOrg {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto VPG Identifier')] [string] $ZertoOrgIdentifier
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/v1/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }
        if ( [string]::IsNullOrEmpty($ZertoOrgIdentifier)  ) {
            throw "Missing Zerto Org Identifier"
        }
        
        $FullURL = $baseURL + "zorgs/" + $ZertoOrgIdentifier
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

#region Zerto Resoure Report

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoResoureReport {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report From Time (YYYY-MM-DD HH:MM:SS)')] [string] $FromTime, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report To Time (YYYY-MM-DD HH:MM:SS)')] [string] $ToTime, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Report Start Index ')] [string] $StartIndex, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Report Records to retrieve 1 to 500')] [string] $Count = 500
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/ZvmService/ResourceReport/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        if ($Count -lt 1 -or $Count -gt 500) {
            throw "Invalid Count - must be from 1 to 500"
        }  

        $FullURL = $baseURL + "getSamples"
        if ($FromTime -or $ToTime -or $StartIndex -or $Count ) {
            $qs = [ordered] @{}
            if ($FromTime)   { if (Parse-ZertoDate($FromTime))    { $qs.Add("fromTimeString", $FromTime) } else { throw "Invalid FromTime: '$FromTime'" } }
            if ($ToTime)     { if (Parse-ZertoDate($ToTime))      { $qs.Add("toTimeString",   $ToTime)   } else { throw "Invalid ToTime: '$ToTime'" } }
            if ($StartIndex) { $qs.Add("startIndex",    $StartIndex)  }
            if ($Count) { $qs.Add("count", $Count) }
            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }

    # .ExternalHelp ZertoModule.psm1-help.xml
    Function Get-ZertoResoureReportAdvFilter {
        param(
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server')] [string] $ZertoServer = "il1zerto.nuveen.com",
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Server URL Port')] [string] $ZertoPort = 9669,
            [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage = 'Zerto authentication token from Get-ZertoAuthToken')] [Hashtable] $ZertoToken,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report From Time (YYYY-MM-DD HH:MM:SS)')] [string] $FromTime, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report To Time (YYYY-MM-DD HH:MM:SS)')] [string] $ToTime, 
            [Parameter(Mandatory=$false, HelpMessage = 'Zerto Report Start Index ')] [string] $StartIndex, 
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report Records to Retrieve 1 to 500')] [string] $Count,
            [Parameter(Mandatory=$true, HelpMessage = 'Zerto Report Records Advanced Filter')] [string] $Filter
        )

        $baseURL = "https://" + $ZertoServer + ":"+$ZertoPort+"/ZvmService/ResourceReport/"
        $TypeJSON = "application/json"

        if ( $ZertoToken -eq $null) {
            throw "Missing Zerto Authentication Token"
        }

        $FullURL = $baseURL + "getSamples"
        if ($FromTime -or $ToTime -or $StartIndex -or $Count -or $Filter ) {
            $qs = [ordered] @{}
            if ($FromTime)   { if (Parse-ZertoDate($FromTime))    { $qs.Add("fromTimeString", $FromTime) } else { throw "Invalid FromTime: '$FromTime'" } }
            if ($ToTime)     { if (Parse-ZertoDate($ToTime))      { $qs.Add("toTimeString",   $ToTime)   } else { throw "Invalid ToTime: '$ToTime'" } }
            if ($StartIndex) { $qs.Add("startIndex",    $StartIndex)  }
            if ($Count) { $qs.Add("count", $Count) }
            if ($Filter) { $qs.Add("Filter", $Filter) }
            $FullURL += Get-QueryStringFromHashTable -QueryStringHash $QS
        }
        Write-Verbose $FullURL

        try {
            $Result = Invoke-RestMethod -Uri $FullURL -TimeoutSec 100 -Headers $ZertoToken -ContentType $TypeJSON
        } catch {
            Test-RESTError -err $_
        }
        return $Result
    }
#endregion

# $PrivateFunctions = @('Set-SSLCertByPass', 'Get-QueryStringFromHashTable', 'Parse-ZertoDate', 'Test-RESTError' )
# ( "Export-ModuleMember -function " + ( Get-Content .\ZertoModule\ZertoModule.psm1 | ForEach-Object {$_.trim()} | `
#                                         Where-Object { $_ -imatch "^Function *" } | sort | ForEach-Object {  ($_ -split "\s",3)[1] } | `
#                                         Where-Object {$_ -notin $PrivateFunctions} | ForEach-Object { "```n`t`t`t" + $_ + "," })).TrimEnd( ',```n' )


# $PrivateFunctions = @('Set-SSLCertByPass', 'Get-QueryStringFromHashTable', 'Parse-ZertoDate', 'Test-RESTError' )
# Get-Content .\ZertoModule\ZertoModule.psm1 | ForEach-Object {$_.trim()} |  Where-Object { $_ -imatch "^Function *" } | sort | ForEach-Object {  ($_ -split "\s",3)[1] } | Where-Object {$_ -notin $PrivateFunctions} | ForEach-Object {$_ + ", "}

Export-ModuleMember -function   Add-ZertoVPG, 
                                Add-ZertoVRA, 
                                Commit-ZertoVPGSetting, 
                                Convert-ZertoVPGToVPGSetting, 
                                Get-ZertoAlert, 
                                Get-ZertoAlertEntities, 
                                Get-ZertoAlertHelpIdentifierDescription, 
                                Get-ZertoAlertHelpIdentifiers, 
                                Get-ZertoAlertLevels, 
                                Get-ZertoAlerts, 
                                Get-ZertoAuthToken, 
                                Get-ZertoEvent, 
                                Get-ZertoEventCategories, 
                                Get-ZertoEventEntities, 
                                Get-ZertoEvents, 
                                Get-ZertoEventTypes, 
                                Get-ZertoLocalSite, 
                                Get-ZertoLocalSiteID, 
                                Get-ZertoLocalSitePairingStatuses, 
                                Get-ZertoPeerSite, 
                                Get-ZertoPeerSiteID, 
                                Get-ZertoPeerSites, 
                                Get-ZertoResoureReport, 
                                Get-ZertoResoureReportAdvFilter, 
                                Get-ZertoRESTAPIs, 
                                Get-ZertoServiceProfile, 
                                Get-ZertoServiceProfileID, 
                                Get-ZertoServiceProfiles, 
                                Get-ZertoSite, 
                                Get-ZertoSiteDatastoreClusterID, 
                                Get-ZertoSiteDatastoreClusters, 
                                Get-ZertoSiteDatastoreID, 
                                Get-ZertoSiteDatastores, 
                                Get-ZertoSiteFolderID, 
                                Get-ZertoSiteFolders, 
                                Get-ZertoSiteHost, 
                                Get-ZertoSiteHostClusterID, 
                                Get-ZertoSiteHostClusters, 
                                Get-ZertoSiteHostID, 
                                Get-ZertoSiteHosts, 
                                Get-ZertoSiteID, 
                                Get-ZertoSiteNetworkID, 
                                Get-ZertoSiteNetworks, 
                                Get-ZertoSiteOrgVCDs, 
                                Get-ZertoSiteResourcePools, 
                                Get-ZertoSites, 
                                Get-ZertoSiteVApps, 
                                Get-ZertoSiteVcdVapps, 
                                Get-ZertoSiteVMID, 
                                Get-ZertoSiteVMs, 
                                Get-ZertoTask, 
                                Get-ZertoTasks, 
                                Get-ZertoTasksTypes, 
                                Get-ZertoVirtualizationSite, 
                                Get-ZertoVirtualizationSiteID, 
                                Get-ZertoVirtualizationSites, 
                                Get-ZertoVM, 
                                Get-ZertoVMID, 
                                Get-ZertoVMs, 
                                Get-ZertoVPG, 
                                Get-ZertoVPGCheckpointID, 
                                Get-ZertoVPGCheckpointLastID, 
                                Get-ZertoVPGCheckpoints, 
                                Get-ZertoVPGCheckpointSummary, 
                                Get-ZertoVPGEntityTypes, 
                                Get-ZertoVPGFailoverCommitPolicies, 
                                Get-ZertoVPGFailoverShutdownPolicies, 
                                Get-ZertoVPGID, 
                                Get-ZertoVPGPriorities, 
                                Get-ZertoVPGRetentionPolicies, 
                                Get-ZertoVPGs, 
                                Get-ZertoVPGSetting, 
                                Get-ZertoVPGSettingBackup, 
                                Get-ZertoVPGSettingBackupDayOfWeek, 
                                Get-ZertoVPGSettingBackupRetentionPeriod, 
                                Get-ZertoVPGSettingBackupSchedulerPeriod, 
                                Get-ZertoVPGSettingBasic, 
                                Get-ZertoVPGSettingBootGroup, 
                                Get-ZertoVPGSettingID, 
                                Get-ZertoVPGSettingJournal, 
                                Get-ZertoVPGSettingNetworks, 
                                Get-ZertoVPGSettingPriority, 
                                Get-ZertoVPGSettingRecovery, 
                                Get-ZertoVPGSettings, 
                                Get-ZertoVPGSettingScripting, 
                                Get-ZertoVPGSettingVM, 
                                Get-ZertoVPGSettingVMNIC, 
                                Get-ZertoVPGSettingVMNICs, 
                                Get-ZertoVPGSettingVMs, 
                                Get-ZertoVPGSettingVMVolume, 
                                Get-ZertoVPGSettingVMVolumes, 
                                Get-ZertoVPGStatuses, 
                                Get-ZertoVPGSubstatuses, 
                                Get-ZertoVRA, 
                                Get-ZertoVRAID, 
                                Get-ZertoVRAIPConfigurationTypes, 
                                Get-ZertoVRAs, 
                                Get-ZertoVRAStatuses, 
                                Get-ZertoZOrg, 
                                Get-ZertoZOrgs, 
                                Invoke-ZertoAlertDismiss, 
                                Invoke-ZertoAlertUndismiss, 
                                Invoke-ZertoVPGFailoverCommit, 
                                Invoke-ZertoVPGFailoverRollback, 
                                Invoke-ZertoVPGForceSync, 
                                Invoke-ZertoVPGPause, 
                                Invoke-ZertoVPGResume, 
                                Invoke-ZertoVRAUpgrade, 
                                New-ZertoFailoverIPAddress, 
                                New-ZertoVPGSettingBasic, 
                                New-ZertoVPGSettingBootgroup, 
                                New-ZertoVPGSettingJournal, 
                                New-ZertoVPGSettingJournalLimitation, 
                                New-ZertoVPGVirtualMachine, 
                                New-ZertoVRAIPAddressConfig, 
                                Remove-ZertoAuthToken, 
                                Remove-ZertoVPG, 
                                Remove-ZertoVPGSetting, 
                                Remove-ZertoVRA, 
                                Set-ZertoVPGSettingBasic, 
                                Start-ZertoVPGClone, 
                                Start-ZertoVPGFailover, 
                                Start-ZertoVPGFailoverTest, 
                                Stop-ZertoVPGClone, 
                                Stop-ZertoVPGFailoverTest