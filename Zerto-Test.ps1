Remove-Module ZertoModule; Import-Module .\ZertoModule\ZertoModule

$ztoken = Get-ZertoAuthToken -ZertoUser nuveen\ep_lewish

Add-ZertoVPG -ZertoToken $ztoken -Priority Low -Verbose `
                -VPGName "ChrisLewis2" `
                -RecoverySiteName CHALB `
                -ClusterName  CHALBCLU-03 `
                -FailoverNetwork GuestNet_952  `
                -TestNetwork GuestNet_952  `
                -DatastoreName CHALBTINTRIA101 `
                -JournalDatastoreName CHALBTINTRIA101 `
                -vCenterFolder Zerto `
                -VmNames WATERMELON-V


Add-ZertoVPG -ZertoToken $ztoken -Priority Low -Verbose `
                -VPGName "ChrisLewis" `
                -RecoverySiteName CHALB `
                -HostName chalbesx12.se.tiaa-cref.org `
                -FailoverNetwork GuestNet_952  `
                -TestNetwork GuestNet_952  `
                -DatastoreName CHALBTINTRIA101 `
                -JournalDatastoreName CHALBTINTRIA101 `
                -vCenterFolder LewisTest `
                -VmNames WATERMELON-V

#Gresham Boxes
#IL1WB0890SBX

$IP1 = New-ZertoFailoverIPAddress -NICName 'Network Adapter 1' `
                            -IPAddress '10.199.199.123' `
                            -SubnetMask  '255.255.0.0' `
                            -Gateway '10.199.199.1' `
                            -DNS1 '10.77.182.137' `
                            -DNS2 '10.77.182.163' `
                            -DNSSuffix 'nuveen.com'

$IP2 = New-ZertoFailoverIPAddress -NICName 'Network Adapter 2' `
                            -IPAddress '10.199.199.124' `
                            -SubnetMask  '255.255.0.0' `
                            -Gateway '10.199.199.1' `
                            -DNS1 '10.77.182.137' `
                            -DNS2 '10.77.182.163' `
                            -DNSSuffix 'nuveen.com'


$VM1 = New-ZertoVMFailoverIPAddress -VMName 'IL1ZTest01' -FailoverIPAddress $IP1

#MultiNIC
$VM2 = New-ZertoVMFailoverIPAddress -VMName 'IL1ZTest01' -FailoverIPAddress $IP1,$IP2


Add-ZertoVPG -ZertoToken $ztoken -Priority Low -Verbose `
            -VPGName "ChrisLewis" `
            -RecoverySiteName 'Zerto-IL1' `
            -ClusterName  'dus01' `
            -FailoverNetwork 'priv001hb'  `
            -TestNetwork 'priv001hb' `
            -DatastoreName 'IL1VSP1_ZTO_LD104F_CP2_P1-6' `
            -JournalDatastoreName 'IL1VSP1_ZTO_LD104F_CP2_P1-6' `
            -vCenterFolder 'Zerto-VM-Recovery'  `
            -VmNamesAndIPAddresses $Vm1  -DumpJson
                 

$VMs = @()
$Vm1 = New-ZertoIPAddress -VMName 'IL1ZTest01' `
                            -IPAddress '10.199.199.123' `
                            -SubnetMask  '255.255.0.0' `
                            -Gateway '10.199.199.1' `
                            -DNS1 '10.77.182.137' `
                            -DNS2 '10.77.182.163' `
                            -DNSSuffix 'nuveen.com'

$Vm2 = New-ZertoIPAddress -VMName 'IL1ZTest02' `
                            -IPAddress '10.199.199.124' `
                            -SubnetMask  '255.255.0.0' `
                            -Gateway '10.199.199.1' `
                            -DNS1 '10.77.182.137' `
                            -DNS2 '10.77.182.163' `
                            -DNSSuffix 'nuveen.com'
$VMs += $VM1
$VMs += $VM2

Add-ZertoVPG -ZertoToken $ztoken -Priority Low -Verbose `
            -VPGName "ChrisLewis" `
            -RecoverySiteName 'Zerto-IL1' `
            -ClusterName  'dus01' `
            -FailoverNetwork 'priv001hb'  `
            -TestNetwork 'priv001hb' `
            -DatastoreName 'IL1VSP1_ZTO_LD104F_CP2_P1-6' `
            -JournalDatastoreName 'IL1VSP1_ZTO_LD104F_CP2_P1-6' `
            -vCenterFolder 'Zerto-VM-Recovery'  `
            -VmNamesAndIPAddresses $VMs