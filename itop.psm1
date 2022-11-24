<#

Requires MySql libraries to be imported first when using the Data Synchro functions, see posh-mysql

#>

Function Get-iTopVirtualDeviceVolume {
    <#
    .Synopsis
    Get volume information for a virtual device (Virtualmachine, Hypervisor, Farm)

    .Description
    Get volume information for a virtual device (Virtualmachine, Hypervisor, Farm)

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-iTopVirtualDeviceVolume -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-iTopVirtualDeviceVolume -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = 'MySQL'"

#>

    [CmdletBinding(DefaultParameterSetName='All')]
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(ParameterSetName='name',Mandatory=$False)][string]$virtualDeviceName,
        [Parameter(ParameterSetName='id',Mandatory=$False)][string]$virtualDeviceID,
        [Parameter(ParameterSetName='oql',Mandatory=$False)][string]$oqlFilter,
        [Parameter(ParameterSetName='oql',Mandatory=$False)][string]$outputFields='*'
    )

    switch($PSCmdlet.ParameterSetName)
    {
        'name'{Get-iTopObject -objectClass 'lnkVirtualDeviceToVolume' -oqlFilter "WHERE virtualdevice_name = '$virtualDeviceName'" -ouputFields $outputFields -uri $uri -credentials $credentials}
        'id' {Get-iTopObject -objectClass 'lnkVirtualDeviceToVolume' -oqlFilter "WHERE virtualdevice_id = '$virtualDeviceID'" -ouputFields $outputFields -uri $uri -credentials $credentials}
        'oql' {Get-iTopObject -objectClass 'lnkVirtualDeviceToVolume' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials}
        default {Get-iTopObject -objectClass 'lnkVirtualDeviceToVolume' -uri $uri -credentials $credentials}
    }
}

Function Get-Software {
    <#
    .Synopsis
    Find software

    .Description
    Find software

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = 'MySQL'"

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Write-Warning ("Function name {0} is deprecated.  Use {1} instead." -f $MyInvocation.MyCommand,"$($MyInvocation.MyCommand.Name -replace '-','-iTop')")
    Get-iTopObject -objectClass 'Software' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}
New-Alias -Name Get-iTopSoftware -Value Get-Software -Force


Function Get-iTopGlobalIPSetting {
    <#
    .Synopsis
    Find Global IP Settings (IPConfig)

    .Description
    Find global IP settings

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = 'MySQL'"

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Get-iTopObject -objectClass 'IPConfig' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-iTopDomain {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Get-iTopObject -objectClass 'Domain' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-iTopIPUsage {
    <#
    .Synopsis
    Find Global IP Settings (IPConfig)

    .Description
    Find global IP settings

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = 'MySQL'"

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Get-iTopObject -objectClass 'IPUsage' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-iTopLocation {
    <#
    .Synopsis
    Find software

    .Description
    Find software

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Software -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = 'MySQL'"

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Get-iTopObject -objectClass 'Location' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-SynchroDataSource {
    <#
    .Synopsis
    Find a synchronization data source

    .Description
    Find a synchronization data source

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service


    .Example
    Get-SynchroDataSource -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-SynchroDataSource -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'DEV VMware Source'}

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Write-Warning ("Function name {0} is deprecated.  Use {1} instead." -f $MyInvocation.MyCommand,"$($MyInvocation.MyCommand.Name -replace '-','-iTop')")
    Get-iTopObject -objectClass 'SynchroDataSource' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}
New-Alias -Name Get-iTopSynchroDataSource -Value Get-SynchroDataSource -Force

Function Get-FunctionalCI {
    <#
    .Synopsis
    Get a functional CI

    .Description
    Get a functional CI

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service


    .Example
    Get-FunctionalCI -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-FunctionalCI -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'DEV VMware Source'}

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Write-Warning ("Function name {0} is deprecated.  Use {1} instead." -f $MyInvocation.MyCommand,"Get-iTopCI")
    Get-iTopObject -objectClass 'FunctionalCI' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}
New-Alias -Name Get-iTopCI -Value Get-FunctionalCI -Force

Function Get-Enclosure {
    <#
    .Synopsis
    Get an enclosure or collection of enclosures

    .Description
    Get an enclosure or collection of enclosures

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Enclosure -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Enclosure -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.serialnumber -eq 'abc123'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Enclosure' -ouputFields '*' -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-Rack {
    <#
    .Synopsis
    Get rack or collection of racks

    .Description
    Get rack or collection of racks

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Rack -credentials (Get-Credential) -uri 'https://webservice.edu'

    .Example
    Get-Rack -credentials (Get-Credential) -uri 'https://webservice.edu' -oqlFilter "WHERE name = 'F15'"

    .Example
    Get-Rack -credentials (Get-Credential) -uri 'https://webservice.edu' -oqlFilter "WHERE nb_u > 20"
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Rack' -ouputFields '*' -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-StorageSystem {
    <#
    .Synopsis
    Get an enclosure or collection of storage systems

    .Description
    Get an enclosure or collection of storage systems

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-StorageSystem -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-StorageSystem -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.name -eq 'abc123'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'StorageSystem' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-iTopLogicalInterface {
    <#
    .Synopsis
    Get an logial interface or collection of logical interfaces

    .Description
    Get an logial interface or collection of logical interfaces

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-iTopLogicalInterface -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-iTopLogicalInterface -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.macaddress -eq '00:00:00:00:00:00'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'LogicalInterface' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-LogicalVolume {
    <#
    .Synopsis
    Get an enclosure or collection of logical volumes

    .Description
    Get an enclosure or collection of logical volumes

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-LogicalVolume -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-LogicalVolume -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.name -eq 'abc123'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'LogicalVolume' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}

Function Get-Brand {
    <#
    .Synopsis
    Get a brand typology or collection of brands

    .Description
    Get a brand typology or collection of brands

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Brand -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Brand -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'HP Inc.'}
#>

    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Brand' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}

Function Get-ContactType {
    <#
    .Synopsis
    Get a contact type typology or collection of brands

    .Description
    Get a contact type typology or collection of brands

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-ContactType -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-ContactType -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'Functional Owner'}
#>

    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'ContactType' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}
New-Alias -Name Get-iTopContactType -Value Get-ContactType -Force
New-Alias -Name Get-iTopRole -Value Get-ContactType -Force

Function Get-ContractType {
    <#
    .Synopsis
    Get a contract typology or collection of contract types

    .Description
    Get a contract typology or collection of contract types

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-ContractType -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-ContractType -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'Blade'}
#>

    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'ContractType' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}

Function Get-Model {
    <#
    .Synopsis
    Get a model typology or collection of brands

    .Description
    Get a model typology or collection of brands

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-Model -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-Model -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'R720'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Model' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}

Function Get-OSVersion {
    <#
    .Synopsis
    Get an OS Version typology or collection of OS Versions

    .Description
    Get an OS Version typology or collection of OS Versions

    .Parameter authName
    Logon for the iTop web service

    .Parameter authPwd
    Password for the iTop web service

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-OSVersion -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-OSVersion -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -like 'Service Pack*'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    Get-iTopObject -objectClass 'OSVersion' -ouputFields '*' -uri $uri -credentials $credentials
}

Function Get-OSFamily {
    <#
    .Synopsis
    Get an OS Family typology or collection of OS Families

    .Description
    Get an OS Family typology or collection of OS Families

    .Parameter credentials
    PSCredential used for authentication

    .Parameter uri
    uri for the iTop web service

    .Example
    Get-OSFamily -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    .Example
    Get-OSFamily -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -like 'Microsoft*'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    Get-iTopObject -objectClass 'OSFamily' -ouputFields '*' -uri $uri -credentials $credentials
}

Function Get-Server {
    <#
 .Synopsis
  Get a server collection of servers

 .Description
  Get a server collection of servers
  
 .Parameter name
  Optional, otherwise returns collection

 .Parameter credentials
  PSCredential used for authentication

 .Parameter uri
  uri for the iTop web service

 .Example
   Get-Model -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

 .Example
   Get-Model -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.serialnumber -eq 'H1SMQ3'}
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Server' -oqlFilter $oqlFilter -ouputFields $outputFields -uri $uri -credentials $credentials
}

Function Get-VirtualFarm {
    <#
     .Synopsis
      Find a virtual farm / cluster

     .Description
      Find a virtual farm / cluster

     .Parameter name
      The name of the farm / cluster

     .Parameter authName
      Logon for the iTop web service

     .Parameter authPwd
      Password for the iTop web service

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-VirtualFarm -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'Cluster 1'}

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Farm' -ouputFields $outputFields -oqlFilter $oqlFilter -uri $uri -credentials $credentials
}

Function Get-Hypervisor {
    <#
 .Synopsis
  Get a hypervisor or collection of hypervisors

 .Description
  Get a hypervisor or collection of hypervisors

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service

 .Example
    Get-Hypervisor -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = `'esxServer01`'" -outputFields 'name,id'
    
 .Example
   Get-Hypervisor -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'Server 1'}

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Hypervisor' -ouputFields $outputFields  -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-DBServer {
    <#
 .Synopsis
  Get a dbserver or collection of dbservers

 .Description
  Get a dbserver or collection of dbservers

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service

 .Example
    Get-DBServer -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' -oqlFilter "WHERE name = `'mySqlServer01`'" -outputFields 'name,id'
    
 .Example
   Get-DBServer -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'mySqlServer01'}

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'DBServer' -ouputFields $outputFields  -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-Organization {
    <#
     .Synopsis
      Get all organizations

     .Description
      Get all organizations

     .Parameter authName
      Logon for the iTop web service

     .Parameter authPwd
      Password for the iTop web service

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-Organization -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'
     
     .Example
       Get-Organization -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.Name -eq 'UC Berkeley'}

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Organization' -ouputFields '*' -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-Contact {
    <#
     .Synopsis
      Get a contact or collection of contacts

     .Description
      Get a contact or collection of contacts including people and teams

     .Parameter authName
      Logon for the iTop web service

     .Parameter authPwd
      Password for the iTop web service

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-Person -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'
     
     .Example
       Get-Person -employeeNumber 123456 -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Contact' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-Team {
    <#
     .Synopsis
      Get a team or collection of teams

     .Description
      Get a team or collection of teams

     .Parameter authName
      Logon for the iTop web service

     .Parameter authPwd
      Password for the iTop web service

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-Team -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Team' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-iTopGroup {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Group' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-iTopIPv4Address {
    <#
     .Synopsis
      Get a IPv4 address or collection of addresses

     .Description
      Get a IPv4 address or collection of addresses

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-iTopIPv4Address -credentials $cred -uri 'https://webservice.edu'
     
     .Example
       Get-iTopIPv4Address -credentials $cred -uri 'https://webservice.edu' -oqlFilter "WHERE status='Allocated'"

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'IPv4Address' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-iTopIPv4Block {
    <#
     .Synopsis
      Get a IPv4 block or collection of blocks

     .Description
      Get a IPv4 block or collection of blocks

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-iTopIPv4Block -credentials $cred -uri 'https://webservice.edu'
     
     .Example
       Get-iTopIPv4Block -credentials $cred -uri 'https://webservice.edu' -oqlFilter "WHERE status='Allocated'"

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'IPv4Block' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-iTopIPv4Subnet {
    <#
     .Synopsis
      Get a IPv4 subnets or collection of subnets

     .Description
      Get a IPv4 subnets or collection of subnets

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-iTopIPv4Subnet -credentials $cred -uri 'https://webservice.edu'
     
     .Example
       Get-iTopIPv4Subnet -credentials $cred -uri 'https://webservice.edu' -oqlFilter "WHERE ip='127.0.0.0'"

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'IPv4Subnet' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-iTopVlan {
    <#
     .Synopsis
      Get a VLAN or collection of VLANS

     .Description
      Get a VLAN subnets or collection of VLANS

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-iTopVlan -credentials $cred -uri 'https://webservice.edu'
     
     .Example
       Get-iTopVlan -credentials $cred -uri 'https://webservice.edu' -oqlFilter "WHERE vlan_tag='4012'"

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'VLAN' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-Person {
    <#
     .Synopsis
      Get a person or collection of people

     .Description
      Get a person or collection of people

     .Parameter employeeNumber
      Employee number, currently same as UID

     .Parameter credentials
      PSCredential used for authentication

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-Person -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'
     
     .Example
       Get-Person -employeeNumber 123456 -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

    #>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Person' -uri $uri -credentials $credentials -oqlFilter $oqlFilter -ouputFields $outputFields
}

Function Get-CustomerContract {
    <#
     .Synopsis
      Get a customer contract or collection of contracts

     .Description
      Get a customer contract or collection of contracts

     .Parameter authName
      Logon for the iTop web service

     .Parameter authPwd
      Password for the iTop web service

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-CustomerContract -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'
     
     .Example
       Get-CustomerContract -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.cost_unit -eq '1-66083-26328-43'}

    #>
    Param(
        [Parameter(Mandatory=$False)][string]$oqlFilter,        
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'CustomerContract' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-ProviderContract {
    <#
     .Synopsis
      Get a provider contract or collection of contracts

     .Description
      Get a provider contract or collection of contracts

     .Parameter authName
      Logon for the iTop web service

     .Parameter authPwd
      Password for the iTop web service

     .Parameter uri
      uri for the iTop web service

     .Example
       Get-ProviderContract -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'
     
     .Example
       Get-ProviderContract -authName 'user' -authPwd 'password' -uri 'https://webservice.edu' | Where {$_.cost_unit -eq '1-66083-26328-43'}

    #>
    Param(
        [Parameter(Mandatory=$False)][string]$oqlFilter,        
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'ProviderContract' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-LinkServiceToSLA {
    Param(
        [Parameter(Mandatory=$True)][object]$service,
        [Parameter(Mandatory=$True)][object]$sla
    )

    $thisArray = @()
    $ciHash = @{}
    $ciHash.add("service_id",("SELECT Service WHERE id =`"$($service.key)`""))
    $ciHash.add("sla_id",("SELECT SLA WHERE id =`"$($sla.key)`""))

    $thisArray += $ciHash
    ,$thisArray
}

Function New-CustomerContract {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$org_name,
        [Parameter(Mandatory=$False)][string]$description,
        [Parameter(Mandatory=$False)][string]$start_date,
        [Parameter(Mandatory=$False)][string]$end_date,
        [Parameter(Mandatory=$False)][string]$cost,
        [Parameter(Mandatory=$False)][string]$cost_currency='dollars',
        [Parameter(Mandatory=$False)][string]$contracttype_name,        # use SELECT ContractType to get relation
        [Parameter(Mandatory=$False)]$contacts,            # collection of people CIs
        [Parameter(Mandatory=$False)][string]$billing_frequency,
        [Parameter(Mandatory=$False)][string]$cost_unit,
        [Parameter(Mandatory=$True)][string]$provider_name,               #use SELECT Organization of of provider
        [Parameter(Mandatory=$True)][string]$status='production',
        [Parameter(Mandatory=$False)]$functionalcis,            # collection of CI objects
        [Parameter(Mandatory=$False)]$linkServiceToSLA,            # array of service to sla hash, get-linkservicetosla
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    # build our linked objects, iTop only want certain lookup fields per object, so we'll feed those in
    $contacts_list = @()
    foreach($ci in $contacts) {
        $ciHash = @{}
        $ciHash.add("contact_id",("SELECT Contact WHERE id =`"$($ci.key)`""))
        $contacts_list += $ciHash
    }

    $functionalcis_list = @()
    foreach($ci in $functionalcis) {
        $ciHash = @{}
        $ciHash.add("functionalci_id",("SELECT FunctionalCI WHERE id =`"$($ci.key)`""))
        $functionalcis_list += $ciHash
    }


    $fields = New-Object PSObject -Property @{
        name = $name
        org_id = "SELECT Organization WHERE name = `"$org_name`""
        description = $description
        start_date = $start_date
        end_date = $end_date
        cost = $cost
        cost_currency = $cost_currency
        contracttype_id = "SELECT ContractType WHERE name = `"$contracttype_name`""
        contacts_list = $contacts_list
        billing_frequency = $billing_frequency
        cost_unit = $cost_unit
        provider_id = "SELECT Organization WHERE name = `"$provider_name`""
        status = $status
        services_list = $linkServiceToSLA
        functionalcis_list = $functionalcis_list   
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'CustomerContract'
        comment = 'Synchronization from load scripts'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-Organization {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$code,
        [Parameter(Mandatory=$True)][string]$parent_name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        parent_id = "SELECT Organization WHERE name = `"$parent_name`""
        name = $name
        code = $code
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'Organization'
        comment = 'Synchronization from load scripts'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-Brand {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        name = $name
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'Brand'
        comment = 'Synchronization from load scripts'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-ContactType {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        name = $name
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'ContactType'
        comment = 'Synchronization from load scripts'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-Model {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$type,
        [Parameter(Mandatory=$True)][string]$brand_id,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        name = $name
        type = $type
        brand_id = $brand_id
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'Model'
        comment = 'Synchronization from load scripts'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-OSFamily {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        name = $name
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'OSFamily'
        comment = 'Created via API call'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-OSVersion {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$osfamily_name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        name = $name
        osfamily_id = "SELECT OSFamily WHERE name = `"$osfamily_name`""
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'OSVersion'
        comment = 'Created via API call'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-VirtualFarm {
    Param(
        [Parameter(Mandatory=$True)][string]$uuid,
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$org_name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )
    $fields = New-Object PSObject -Property @{
        org_id = "SELECT Organization WHERE name = `"$org_name`""
        name = $name
        uuid = $uuid
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'Farm'
        comment = 'Synchronization from vCenter'
        output_fields = '*'
        fields = $fields
    }

    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-Hypervisor {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$org_name,
        [Parameter(Mandatory=$False)][string]$farm_name,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    $fields = New-Object PSObject -Property @{
        org_id = "SELECT Organization WHERE name = `"$org_name`""
        name = $name
    }

    # add optional parameters
    if($farm_name -ne $null -and $farm_name -ne 'host' -and $farm_name -ne '') {
        $fields | Add-Member -NotePropertyName farm_id -NotePropertyValue "SELECT Farm WHERE name = `"$farm_name`""
    }
    
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'Hypervisor'
        comment = 'Synchronization from vCenter'
        output_fields = '*'
        fields = $fields
    }

    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-Team {
    Param(
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$False)][string]$email = $null,
        [Parameter(Mandatory=$False)][string]$phone = $null,
        [Parameter(Mandatory=$False)][string]$orgName,
        [Parameter(Mandatory=$False)][string]$orgID,
        [Parameter(Mandatory=$False)][string]$function,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    if($PSBoundParameters.ContainsKey('orgName')) {
        $fields = New-Object PSObject -Property @{
            org_id = "SELECT Organization WHERE name = `"$orgName`""
            name = $name
        }
    } else {
        $fields = New-Object PSObject -Property @{
            org_id = "SELECT Organization WHERE id = `"$orgID`""
            name = $name
        }
    }


    # add optional parameters
    if(![String]::IsNullOrEmpty($phone)) {
        $fields | Add-Member -NotePropertyName 'phone' -NotePropertyValue $phone
    }
    if(![String]::IsNullOrEmpty($email)) {
        $fields | Add-Member -NotePropertyName 'email' -NotePropertyValue $email
    }
    if(![String]::IsNullOrEmpty($function)) {
        $fields | Add-Member -NotePropertyName 'function' -NotePropertyValue $function
    }

    New-iTopObject -objectClass 'Team' -fields $fields -credentials $credentials -uri $uri
}

Function New-Person {
    Param(
        [Parameter(Mandatory=$True)][string]$firstName,
        [Parameter(Mandatory=$True)][string]$lastName,
        [Parameter(Mandatory=$True)][string]$email,
        [Parameter(Mandatory=$False)][string]$phone = $null,
        [Parameter(Mandatory=$True)][string]$orgName,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    $fields = New-Object PSObject -Property @{
        org_id = "SELECT Organization WHERE name = `"$orgName`""
        name = $lastName
        first_name = $firstName
        email = $email
    }

    # add optional parameters
    if(![String]::IsNullOrEmpty($phone)) {
        $fields | Add-Member -NotePropertyName 'phone' -NotePropertyValue $phone
    }

    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'Person'
        comment = 'Created using API'
        output_fields = '*'
        fields = $fields
    }
    
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-VirtualMachine {
    <#
 .Synopsis
  Creates a VirtualMachine object in iTop

 .Description
  Creates a VirtualMachine object in iTop

 .Parameter uui
  The unique ID of the VM

 .Parameter name
  The name of the VM

 .Parameter numCPU
  Number of virtual CPUs
 
 .Parameter ramGB
  Amount of memory in GB

 .Parameter hostName
  The hypervisor name, must already exist in iTop

 .Parameter org
  The organization name, must already exist in iTop

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service

 .Example
   Create-VirtualMachine -uuid '0001-0002-0003-00004' -name 'MyVM' -orgName 'Department A' -authName 'user' -authPwd 'password' -uri 'https://webservice.edu'

#>

    Param(
        [Parameter(Mandatory=$True)][string]$uuid,
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$False)][string]$numCPU,
        [Parameter(Mandatory=$False)][string]$ramGB,
        [Parameter(Mandatory=$True)][string]$hostName,
        [Parameter(Mandatory=$false)][string]$orgName,
        [Parameter(Mandatory=$false)][string]$orgID,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    if($PSBoundParameters.ContainsKey('orgName')) {
        $fields = New-Object PSObject -Property @{
            org_id = "SELECT Organization WHERE name = `"$orgName`""
            virtualhost_id = "SELECT VirtualHost WHERE name = `"$hostName`""
            name = $name
            uuid = $uuid
        }
    } else {
        $fields = New-Object PSObject -Property @{
            org_id = "SELECT Organization WHERE id = `"$orgID`""
            virtualhost_id = "SELECT VirtualHost WHERE name = `"$hostName`""
            name = $name
            uuid = $uuid
        }
    }
  

    # add optional parameters
    if($numCPU -ne $null) {
        $fields | Add-Member -NotePropertyName 'cpu' -NotePropertyValue $numCPU
    }
    if($ramGB -ne $null) {
        $fields | Add-Member -NotePropertyName 'ram' -NotePropertyValue $ramGB
    }

    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'VirtualMachine'
        comment = 'Synchronization from vCenter'
        output_fields = '*'
        fields = $fields
    }
    
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function Get-VirtualMachine {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'VirtualMachine' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-ApplicationSolution {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'ApplicationSolution' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-SynchroReplica {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'SynchroReplica' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Remove-CustomerContract {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$customerContract
    )

    Remove-iTopObject -credentials $credentials -uri $uri -object $customerContract
}

Function Remove-iTopObject {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$object
    )

    $operation = New-Object PSObject -Property @{
        operation = 'core/delete'
        class = $object.class
        key = $object.key
    }

    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function Set-Team {

    <#
 .Synopsis
  Updates / sets values on a Team CI

 .Description
  Updates / sets values on a Team CI

 .Parameter team
  The Team CI

 .Parameter PersonRoles
  Hashtable of Person CI (key) : Role CI (val)

 .Parameter CIs
 String or array of CIs owned by the team

 .Parameter orgName
  The organization name, must already exist in iTop

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service

 .Example
    $personCI = Get-Person -Name "Walter Becker"
    $roleCI = Get-Role -Name "Bass Player"
    Get-Team -Name "Steely Dan" | Set-Team -PersonRoles @{$personCI = $roleCI}

#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$team,
        [Parameter(Mandatory=$False)][hashtable]$PersonRoles=$null,
        [Parameter(Mandatory=$False)]$CIs=$null,
        [Parameter(Mandatory=$False)]$orgId=$null
    )
    
    #This is the way we might want to start moving all Set functions to

    # Create a hash table to store all of the fields
    $propertyBag = @{}

    if($PersonRoles -ne $nul) {
        $personsList = @()
        foreach($person in $PersonRoles.Keys) {
            $role = $PersonRoles.$person
            $personHash = @{}

            if($person.key -ne $null) {
                $personHash.Add('person_id',("SELECT Contact WHERE id = `"$($person.key)`""))
            }
            elseif($person.contact_id -ne $null) {
                $personHash.add("person_id",("SELECT Contact WHERE id = `"$($person.contact_id)`""))
            }
            elseif($person.person_id -ne $null) {
                $personHash.add("person_id",("SELECT Contact WHERE id = `"$($person.person_id)`""))
            }
            
            if($role -ne $null) {
                $personHash.Add('role_id',("SELECT ContactType WHERE name = `"$($role.name)`""))
            }

            # Add to the array only if not already there
            $alreadyAdded = $false
            foreach($existingPersonHash in $personsList) {
                if(($existingPersonHash.'person_id' -eq $personHash.'person_id') -and ($existingPersonHash.'role_id' -eq $personHash.'role_id')) {
                    $alreadyAdded = $true
                    break
                }
            }
            if(!$alreadyAdded) {
                $personsList += $personHash
            }
        }
        $propertyBag.Add('persons_list',$personsList)
    }
    if($CIs -ne $null) {
        $propertyBag.Add('cis_list',$CIs)
    }

    Set-iTopObject -credentials $credentials -uri $uri -iTopObject $team -propertyBag $propertyBag

}

Function Set-iTopGlobalIPSetting {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$globalIPSetting,
        [Parameter(Mandatory=$False)][int]$ipv4BlockMinSize,
        [Parameter(Mandatory=$False)][ValidateSet('dtc_no','dtc_yes')][string]$delegateToChildrenOnly='dtc_no',
        [Parameter(Mandatory=$False)][ValidateSet('reserve_no','reserve_yes')][string]$reserveSubnetIPs='dtc_yes',
        [Parameter(Mandatory=$False)][ValidateSet('ipdup_no','ipdup_yes')][string]$allowDuplicateShortName='ipdup_yes'
    )
    
    $propertyBag = @{}

    if($PSBoundParameters.ContainsKey('ipv4BlockMinSize')) {
        $propertyBag.Add('ipv4_block_min_size',$ipv4BlockMinSize)
    }
    if($PSBoundParameters.ContainsKey('delegateToChildrenOnly')) {
        $propertyBag.Add('delegate_to_children_only',$delegateToChildrenOnly)
    }
    if($PSBoundParameters.ContainsKey('reserveSubnetIPs')) {
        $propertyBag.Add('reserve_subnet_IPs',$reserveSubnetIPs)
    }
    if($PSBoundParameters.ContainsKey('allowDuplicateShortName')) {
        $propertyBag.Add('ip_allow_duplicate_name',$allowDuplicateShortName)
    }

    Set-iTopObject -credentials $credentials -uri $uri -iTopObject $globalIPSetting -propertyBag $propertyBag
}


Function Set-iTopObject {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$iTopObject,
        [Parameter(Mandatory=$False)]$propertyBag=@{}
    )

    if($iTopObject.key -eq $null) {
        Throw "Please pass a full iTop object to Set- commandlets.  Missing the key property."
    }

    $fields = New-Object PSObject -Property @{}

    # Property bag can contain a Hashtable to property name/values
    if($propertyBag.count -gt 0) {
        foreach($key in $propertyBag.keys) {
            $fields | Add-Member -MemberType NoteProperty -Name $key -Value $propertyBag[$key]
        }
    }

    $class = $null
    if(![string]::IsNullOrEmpty($iTopObject.finalclass)) {
        $class = $iTopObject.finalclass
    }
    elseif(![string]::IsNullOrEmpty($iTopObject.class)) {
        $class = $iTopObject.class
    }

    $operation = New-Object PSObject -Property @{ 
        operation = 'core/update'
        class = $class
        key = $iTopObject.key
        comment = 'update from API'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
 
}

Function Set-FunctionalCI {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$ci,
        [Parameter(Mandatory=$False)]$contacts,
        [Parameter(Mandatory=$False)]$applicationSolutions,
        [Parameter(Mandatory=$False)]$orgId=$null,
        [Parameter(Mandatory=$False)]$propertyBag=@{}
    )


    # build our linked objects, iTop only want certain lookup fields per object, so we'll feed those in
    $contacts_list = @()
    foreach($contact in $contacts) {
        $contactHash = @{}
        if($contact.key -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.key)`""))
        }
        elseif($contact.contact_id -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.contact_id)`""))
        }
        $contacts_list += $contactHash
    }

    $applicationsolution_list = @()
    foreach($applicationsolution in $applicationSolutions) {
        $appSolutionHash = @{}
        $appSolutionHash.add("applicationsolution_id",("SELECT ApplicationSolution WHERE id = `"$($applicationsolution.key)`""))
        $applicationsolution_list += $appSolutionHash
    }

    $fields = New-Object PSObject -Property @{}

    if($contacts_list.Count -gt 0) {
        $fields | Add-Member -MemberType NoteProperty -Name 'contacts_list' -Value $contacts_list
    }
    if($applicationsolution_list.Count -gt 0) {
        $fields | Add-Member -MemberType NoteProperty -Name 'applicationsolution_list' -Value $applicationsolution_list
    }
    if(![string]::IsNullOrEmpty($orgId)) {
        $fields | Add-Member -MemberType NoteProperty -Name 'org_id' -Value "SELECT Organization WHERE id = `"$orgId`""
    }
    # Property bag can contain a Hashtable to property name/values
    if($propertyBag.count -gt 0) {
        foreach($key in $propertyBag.keys) {
            $fields | Add-Member -MemberType NoteProperty -Name $key -Value $propertyBag[$key]
        }
    }

    $operation = New-Object PSObject -Property @{ 
        operation = 'core/update'
        class = 'FunctionalCI'
        key = $ci.key
        comment = 'update from API'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function Set-CustomerContract {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$customerContract,
        [Parameter(Mandatory=$False)]$contacts,
        [Parameter(Mandatory=$False)]$functionalCIs,
        [Parameter(Mandatory=$False)]$orgId=$null,
        [Parameter(Mandatory=$False)]$cost_unit=$null,
        [Parameter(Mandatory=$False)]$start_date=$null,
        [Parameter(Mandatory=$False)]$end_date=$null,
        [Parameter(Mandatory=$False)]$services_list            # array of service to sla hash, get-linkservicetosla
    )


    # build our linked objects, iTop only wants certain lookup fields per object, so we'll feed those in
    $contacts_list = @()
    foreach($contact in $contacts) {
        $contactHash = @{}
        if($contact.key -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.key)`""))
        }
        elseif($contact.contact_id -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.contact_id)`""))
        }
        elseif($contact.person_id -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.person_id)`""))
        }
        $contacts_list += $contactHash
    }

    $functionalcis_list = @()
    foreach($functionalCI in $functionalCIs | ? {$_ -ne $null}) {
        $functionalciHash = @{}
        $functionalciHash.add("functionalci_id",("SELECT FunctionalCI WHERE id = `"$($functionalCI.key)`""))
        $functionalcis_list += $functionalciHash
    }

    $propertyBag = @{}

    if($contacts_list.Count -gt 0) {
        $propertyBag.Add('contacts_list',$contacts_list)
    }
    if($functionalcis_list.Count -gt 0) {   
        $propertyBag.Add('functionalcis_list',$functionalcis_list)
    }
    if($PSBoundParameters.ContainsKey('org_id')) {   
        $propertyBag.Add('org_id',"SELECT Organization WHERE id = `"$orgId`"")
    }
    if($PSBoundParameters.ContainsKey('cost_unit')) {
        $propertyBag.Add('cost_unit',$cost_unit)
    }
    if($PSBoundParameters.ContainsKey('start_date')) {
        $propertyBag.Add('start_date',$start_date)
    }
    if($PSBoundParameters.ContainsKey('end_date')) {
        $propertyBag.Add('end_date',$end_date)
    }
    if($PSBoundParameters.ContainsKey('services_list')) {
        $propertyBag.Add('services_list',$services_list)
    }

    Set-iTopObject -credentials $credentials -uri $uri -iTopObject $customerContract -propertyBag $propertyBag
}

Function Set-VirtualMachine {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$virtualMachine,
        [Parameter(Mandatory=$False)]$contacts,
        [Parameter(Mandatory=$False)]$org_id=$null,
        [Parameter(Mandatory=$False)]$dataclassification=$null
    )

    # build our linked objects, iTop only wants certain lookup fields per object, so we'll feed those in
    $contacts_list = @()
    foreach($contact in $contacts) {
        $contactHash = @{}
        if($contact.key -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.key)`""))
        }
        elseif($contact.contact_id -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.contact_id)`""))
        }
        elseif($contact.person_id -ne $null) {
            $contactHash.add("contact_id",("SELECT Contact WHERE id = `"$($contact.person_id)`""))
        }
        $contacts_list += $contactHash
    }

    $propertyBag = @{}

    if($contacts_list.Count -gt 0) {
        $propertyBag.Add('contacts_list',$contacts_list)
    }
    if($PSBoundParameters.ContainsKey('org_id')) {   
        $propertyBag.Add('org_id',"SELECT Organization WHERE id = `"$org_id`"")
    }
    if($PSBoundParameters.ContainsKey('dataclassification')) {
        $propertyBag.Add('dataclassification',$dataclassification)
    }

    Set-iTopObject -credentials $credentials -uri $uri -iTopObject $virtualMachine -propertyBag $propertyBag
}

Function New-iTopDomain {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)]$orgId
    )

    $fields = New-Object PSObject -Property @{
        name = $name;org_id = "SELECT Organization WHERE id = `"$orgId`""
    }
    New-iTopObject -objectClass 'Domain' -fields  $fields -credentials $credentials -uri $uri
}

Function New-Software {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$True)][string]$vendor,
        [Parameter(Mandatory=$True)][string]$version,
        [Parameter(Mandatory=$True)][string]$type
    )
    
    $propertyBag = @{}
    if($PSBoundParameters.ContainsKey('vendor')) {
        $propertyBag.Add('vendor',$vendor)
    }
    if($PSBoundParameters.ContainsKey('version')) {
        $propertyBag.Add('version',$version)
    }
    if($PSBoundParameters.ContainsKey('type')) {
        $propertyBag.Add('type',$type)
    }

    # Before creating check to see if it already exists using all 'keys'
    $oqlFilter = "WHERE name = '$name'"
    $propertyBag.Keys | % {$oqlFilter += " AND $_ = '$($propertyBag.$_)'"}

    $thisSoftware = Get-Software -credentials $credentials -uri $uri -oqlFilter $oqlFilter
    if(!$thisSoftware) {
        $fields = New-Object PSObject -Property @{
            name = $name
        }

        $propertyBag.Keys | % {$fields | Add-Member -MemberType NoteProperty -Name $_ -Value $propertyBag.$_}

        New-iTopObject -objectClass "Software" -fields $fields -credentials $credentials -uri $uri
    }
    else {
        $thisSoftware
    }
}

Function Get-Service {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'Service' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter

}

Function Get-SLA {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'SLA' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function Get-LDAPUser {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )

    Get-iTopObject -objectClass 'UserLDAP' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function New-LDAPUser {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$contact,
        [Parameter(Mandatory=$True)][string]$login,
        [Parameter(Mandatory=$True)][array]$profiles,
        [Parameter(Mandatory=$False)][array]$allowedOrgs
    )
    # build our linked objects, iTop only want certain lookup fields per object, so we'll feed those in
    $profile_list = @()
    foreach($p in $profiles) {
        $pHash = @{}
        $phash.add("profileid",("SELECT URP_Profiles WHERE id =`"$($p.key)`""))
        $profile_list += $pHash
    }

    $allowed_org_list = @()
    foreach($o in $allowedOrgs) {
        $oHash = @{}
        $oHash.add("allowed_org_id",("SELECT Organization WHERE id =`"$($o.key)`""))
        $allowed_org_list += $oHash
    }

    $fields = New-Object PSObject -Property @{
        contactid = $contact.key
        profile_list = $profile_list
        allowed_org_list = $allowed_org_list
        login = $login
    }

    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = 'UserLDAP'
        comment = 'Create from API call'
        output_fields = '*'
        fields = $fields
    }
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function Get-Profile {
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$False)][string]$outputFields='*'
    )
    Get-iTopObject -objectClass 'URP_Profiles' -ouputFields $outputFields -uri $uri -credentials $credentials -oqlFilter $oqlFilter
}

Function New-VirtualMachineReplica {
    Param(
        [Parameter(Mandatory=$True)][string]$uuid,
        [Parameter(Mandatory=$True)][string]$name,
        [Parameter(Mandatory=$False)][string]$cpu,
        [Parameter(Mandatory=$False)][string]$ram,
        [Parameter(Mandatory=$True)][string]$virtualhost_id,
        [Parameter(Mandatory=$True)][string]$orgKey,
        [Parameter(Mandatory=$True)][object]$datasourceObject,
        [Parameter(Mandatory=$True)][string]$ITOP_DB_Server,
        [Parameter(Mandatory=$True)][string]$ITOP_DB_authName,
        [Parameter(Mandatory=$True)][string]$ITOP_DB_authPwd,
        [Parameter(Mandatory=$True)][string]$ITOP_DB_Name
    )

    $synchroTableName = $datasourceObject.database_table_name

    # Update VM synchro data
    $updateStatement = "INSERT INTO $synchroTableName (primary_key,uuid,virtualhost_id,name,org_id,business_criticity,status,cpu,ram) 
                        VALUES (`'$uuid`',`'$uuid`',`'$virtualhost_id`',`'$name`',$orgKey,`'$businessCriticity`',`'$status`',`'$cpu`',`'$ram`') 
                        ON DUPLICATE KEY UPDATE 
                            name=VALUES(name), 
                            org_id=VALUES(org_id),
                            virtualhost_id=VALUES(virtualhost_id), 
                            cpu=VALUES(cpu),
                            ram=VALUES(ram)"

    $res = Invoke-NonQuery -serverName $ITOP_DB_Server -userName $ITOP_DB_authName -password $ITOP_DB_authPwd -dbName $ITOP_DB_Name -query $updateStatement
    $res
}

Function Get-iTopObject {
    <#
 .Synopsis
  Retrieves an iTop object.

 .Description
  Private helper function.  All Get-* commandlets go here.  This is a generic handler for getting iTop objects using the REST service and an OQL query. 

 .Parameter oqlFilter
  Optional WHERE clause of an OQL query to filter results.

 .Parameter objectClass
  The type iTop object to return.

 .Parameter ouputFields
  Fields to return.  By default returns all fields.

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service
#>

    Param(
        [Parameter(Mandatory=$False)][string]$oqlFilter,
        [Parameter(Mandatory=$True)][string]$objectClass,
        [Parameter(Mandatory=$False)][string]$ouputFields='*',
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    $query = "SELECT $objectClass"

    # Calculate our OQL query
    if(![string]::IsNullOrEmpty($oqlFilter)) {
        $query = $query + " $oqlFilter"
    }

    # Create a hash/psobject of our request
    $operation = New-Object PSObject -Property @{
        operation = 'core/get'
        class = $objectClass
        key = $query
        output_fields = $ouputFields
    }

    # Format the request and send it to iTop
    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function New-iTopObject {
    Param(
        [Parameter(Mandatory=$True)][string]$objectClass,
        [Parameter(Mandatory=$True)]$fields,
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri
    )

    # Take in an array of PSObject, the class name, and anything mandatory
    # Format the request and send it to iTop
    $operation = New-Object PSObject -Property @{ 
        operation = 'core/create'
        class = $objectClass
        comment = 'Created using API'
        output_fields = '*'
        fields = $fields
    }

    GenerateAndSendRequest -credentials $credentials -uri $uri -requestHash $operation
}

Function Invoke-SynchroImport {
    <#
 .Synopsis
  Invoke the synchro import over the webservice.

 .Description
  Invoke the synchro import over the webservice.  Expects the URI as something like https://myserver.com/itop/synchro/synchro_import.php

 .Parameter dataSource
  The datasource object to run the synchro

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service

  .Parameter csvData
  the csv data array

#>

    Param(
        [Parameter(Mandatory=$True)]$dataSource,
        [Parameter(Mandatory=$True)]$credentials,
        [Parameter(Mandatory=$True)]$uri,
        [Parameter(Mandatory=$True)]$csvData

    )

    # build our paramter hash
    $requestBody =  @{
        data_source_id=$dataSource.key
        auth_user=$credentials.UserName
        auth_pwd=$credentials.GetNetworkCredential().Password
        csvdata = $csvData
    }

    # send the web request and get the response
    $res = Invoke-WebRequest -Method Post -Uri $uri -Body $requestBody -TimeoutSec 960 -UseBasicParsing
    if($res.StatusCode -eq 200) {
        $res
    }
    else {
        Throw "Synchro_import returned an error when running $res"
    }
}

Function Invoke-BulkExport {
    <#
 .Synopsis
  Invoke the bulk export API.

 .Description
  See https://www.itophub.io/wiki/page?id=2_2_0%3Aadvancedtopics%3Aexportdata

 .Parameter expression
  OQL query

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service

  .Parameter fields
  comma separated list of fields to return

#>
    Param(
        [Parameter(Mandatory=$True)][string]$expression,
        [Parameter(Mandatory=$True)][pscredential]$credential,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)][ValidateSet("html","csv","xml","xlsx")]$format = "csv",
        [Parameter(Mandatory=$True)][string]$fields
    )

    $encExpression = [System.Web.HttpUtility]::UrlEncode($expression)

    $fullUri = "{0}?expression={1}&format={2}&login_mode={3}&fields={4}" -f $uri,$encExpression,$format,"basic",$fields

    # send the web request and get the response
    $res = Invoke-WebRequest -Method Get -Uri $fullUri -TimeoutSec 960 -UseBasicParsing -Credential $credential
    if($res.StatusCode -eq 200) {
        $res.Content
    }
    else {
        Throw "Bulk export returned an error when running $res"
    }
}


Function Invoke-SynchroExec {
    <#
 .Synopsis
  Invoke the synchro exec over the webservice.

 .Description
  Invoke the synchro exec over the webservice.  Expects the URI as something like https://myserver.com/itop/synchro/synchro_exec.php

 .Parameter dataSource
  The datasource object to run the synchro

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service
#>

    Param(
        [Parameter(Mandatory=$True)]$dataSource,
        [Parameter(Mandatory=$TRUE)]$credentials,
        [Parameter(Mandatory=$TRUE)]$uri
    )

    # build our paramter hash
    $requestBody =  @{
        data_sources=$dataSource.key
        auth_user=$credentials.UserName
        auth_pwd=$credentials.GetNetworkCredential().Password
    }

    # send the web request and get the response
    $res = Invoke-WebRequest -Method Post -Uri $uri -Body $requestBody -TimeoutSec 960 -UseBasicParsing
    if($res.StatusCode -eq 200) {
        $res
    }
    else {
        Throw "Synchro_exec returned an error when running $res"
    }
}

Function Invoke-SyncScript {
    Param(
        [Parameter(Mandatory=$TRUE)]$datasourceObject,
        [Parameter(Mandatory=$TRUE)]$ITOP_SSH_Username,
        [Parameter(Mandatory=$TRUE)]$ITOP_SSH_Key,
        [Parameter(Mandatory=$TRUE)]$ITOP_SSH_Passphrase,
        [Parameter(Mandatory=$TRUE)]$ITOP_authName,
        [Parameter(Mandatory=$TRUE)]$ITOP_authPwd,
        [Parameter(Mandatory=$TRUE)]$ITOP_sync_exe_path,
        [Parameter(Mandatory=$TRUE)]$ITOP_server_name
    )
    
    $session = New-SshSession -ComputerName $ITOP_server_name -Username $ITOP_SSH_Username -KeyFile $ITOP_SSH_Key -Passphrase $ITOP_SSH_Passphrase
    $command = 'php -q ' + $ITOP_sync_exe_path + ' --auth_user=' + $ITOP_authName + ' --auth_pwd=' + $ITOP_authPwd + ' --data_sources=' + $datasourceObject.key
    $sshRes = Invoke-SshCommand -ComputerName $ITOP_server_name -Command $command
    $sshRes
}

Function GenerateAndSendRequest {
    <#
 .Synopsis
  Format an iTop request and handle the result.

 .Description
  Private helper function.  Any interaction with iTop Get-/Set-/New- should go through this.

 .Parameter requestHash
  A hashtable of the request to be converted to JSON

 .Parameter authName
  Logon for the iTop web service

 .Parameter authPwd
  Password for the iTop web service

 .Parameter uri
  uri for the iTop web service
#>
    Param(
        [Parameter(Mandatory=$True)][PSCredential]$credentials,
        [Parameter(Mandatory=$True)][string]$uri,
        [Parameter(Mandatory=$True)]$requestHash
    )

    $requestBody =  @{
        version="1.3"
        auth_user=$credentials.UserName
        auth_pwd=$credentials.GetNetworkCredential().Password
        json_data=ConvertTo-Json($requestHash) -Depth 10
    }

    # Make our request to the web service
    $resp = Invoke-WebRequest -Method Post -Uri $uri -Body $requestBody -TimeoutSec 480 -DisableKeepAlive:$True -UseBasicParsing
    $result = $null

    if($IsWindows) {
        # Let's use the .Net JavaScript serializer, the PowerShell implementation is limited in length
        [void][System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions")
        $javaScriptSerializer = New-Object -TypeName System.Web.Script.Serialization.JavaScriptSerializer
        $javaScriptSerializer.MaxJsonLength = [int]::MaxValue
        $javaScriptSerializer.RecursionLimit = 99

        # Deserialize the request into a PowerShell object
        $result = $javaScriptSerializer.DeserializeObject($resp.Content)
    } else {
        $result = $resp.Content | ConvertFrom-Json
    }

    # Is there an unexpected exception?
    if($result.code -ne 0) {
        throw "Result code = $($result.code), $($result.message)"
    }

    # If we have empty objects that simply means the search worked but came up empty for some reason
    if($result.objects.count -eq 0) {
        # Return null
        $null
    }

    # Looks like we have at least one object to return, let's create a PSObject because it's easier to enum
    # We can also add the key and class type of the iTop object
    # Modification par DERET Raphaël le 29/09/2019
    # $result.objects.Keys par $result.objects.$($key.psobject.properties.name)
    [System.Collections.ArrayList] $listThisObject = @()
    if ($null -ne $result.objects) {
        foreach($name in $result.objects.psobject.properties.name) {
            $thisObject = $result.objects.$name.fields
            if($null -ne $result.objects.$name.key) {
                # using the newer API, let's add the key
                $thisObject | Add-Member Noteproperty -Name "key" -Value $result.objects.$name.key
            }
            if($null -ne  $result.objects.$($key.psobject.properties.name).class) {
                # using the newer API, let's add the class
                $thisObject | Add-Member Noteproperty -Name "class" -Value $result.objects.$name.class
            }
            [void]$listThisObject.Add($thisObject)
        }    
        # put the object on the pipline    
        $listThisObject
    }
}

Export-ModuleMember -Function * -Alias *