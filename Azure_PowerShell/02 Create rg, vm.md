### Sign in to Azure Account-
```  
Connect-AzAccount
```
### Create Resource Group--
```  
New-AzResourceGroup -Name 'myResourceGroup' -Location 'eastus'
```
- Example-
```  
New-AzResourceGroup -Name 'devops-az-powershell' -Location 'centralindia'
```
  
#### Create Resource Group using Variables--
```  
$rg = @{
    Name = 'az-powershell'
    Location = 'centralindia'
}
New-AzResourceGroup @rg
```

### Create a VNET--
```  
$vnet = @{
    Name = 'vnet1'
    ResourceGroupName = 'devops-az-powershell'
    Location = 'centralindia'
    AddressPrefix = '192.168.0.0/24'
}
$virtualNetwork = New-AzVirtualNetwork @vnet
```

### Create a subnet within same vnet---
```  
$subnet = @{
    Name = 'subnet1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '192.168.0.0/25'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet
```
- OR
```  
$vnet = Get-AzVirtualNetwork -Name vnet2 -ResourceGroupName dev-test
Add-AzVirtualNetworkSubnetConfig -Name subnet2 -VirtualNetwork $vnet -AddressPrefix 192.168.4.0/25
```

### Delete Resource Group--
```  
Remove-AzResourceGroup -Name 'test-rg' -Force
```

### Create A VM--
```  
New-AzVm -ResourceGroupName 'myResourceGroup' -Name 'myVM' -Location 'eastus' -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' -VirtualNetworkName 'myVnet' -SubnetName 'mySubnet' -SecurityGroupName 'myNetworkSecurityGroup' -PublicIpAddressName 'myPublicIpAddress' -OpenPorts 80,3389
```
- **example**
```  
New-AzVm -ResourceGroupName 'devops-az-powershell' -Name 'WS2022' -Location 'centralindia' -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' -VirtualNetworkName 'vnet1' -SubnetName 'subnet1' -SecurityGroupName 'devops-nsg' -PublicIpAddressName 'ws2022ip' -OpenPorts 80,3389
```
### Get Public IP of the VM-
```  
$publicIpAddress = (Get-AzPublicIpAddress -ResourceGroupName 'devops-az-powershell' -Name "ws2022ip").IpAddress
```
### Take VM on Remote- 
```  
mstsc /v:$publicIpAddress
```

****************************************************************************************************************************
## Create a windows server 2022 VM--
---
### Define Variables-
```  
$resourceGroup = "bbpl"
$location = "centralindia"
$vmName = "vm1"
$vmSize = "Standard_D2s_v3"
$adminUsername = "akkc"
$adminPassword = "Surveillance1@123"

### Log in to Azure
```  
Connect-AzAccount
```
### Set the Subscription-
```  
Set-AzContext -SubscriptionId "your-subscription-id"
```
### Create a Resource Group-
```  
New-AzResourceGroup -Name $resourceGroup -Location $location
```
### Create a Virtual Network and Subnet-
```  
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name "subnet1" -AddressPrefix "10.0.0.0/24"
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroup -Location $location -Name "vnet1" -AddressPrefix "10.0.0.0/16" -Subnet $subnetConfig
```
### Create a Public IP Address
```  
$publicIp = New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location centralindia -Name "ws2022IP" -AllocationMethod static
```
### Create a Network Interface
```  
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroup -Location $location -Name "MyNIC" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIp.Id
```
### Create the Virtual Machine Configuration
```  
$vmConfig = New-AzVMConfig -VMName WS2022 -VMSize $vmSize
$vmConfig = Set-AzVMOperatingSystem -VM $vmConfig -Windows -ComputerName $vmName -Credential (Get-Credential -UserName $adminUsername -Message "Enter the admin password") -ProvisionVMAgent -EnableAutoUpdate
$vmConfig = Set-AzVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2022-Datacenter" -Version "latest"
$vmConfig = Add-AzVMNetworkInterface -VM $vmConfig -Id $nic.Id
```
### Create the Virtual Machine
```  
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig -OpenPorts 80,3389
```
### Verify the VM Creation
```  
Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName
```
### Connect to the VM
```  
$publicIpAddress = (Get-AzPublicIpAddress -ResourceGroupName $resourceGroup -Name "ws2022IP").IpAddress
mstsc /v:$publicIpAddress
```
---


```  
### Set the administrator and password for the VM
$cred = Get-Credential

### Place the virtual network into a variable. ##
$vnet = Get-AzVirtualNetwork -Name 'vnet1' -ResourceGroupName 'dev-test'

### Create a network interface for the VM. ##
$nic = @{
    Name = "nic-1"
    ResourceGroupName = 'dev-test'
    Location = 'eastus2'
    Subnet = $vnet.Subnets[1]
}
$nicVM = New-AzNetworkInterface @nic

### Create a virtual machine configuration. ##
$vmsz = @{
    VMName = "vm-1"
    VMSize = 'Standard_DS1_v2'  
}
$vmos = @{
    ComputerName = "vm-1"
    Credential = $cred
}
$vmimage = @{
    PublisherName = 'Canonical'
    Offer = '0001-com-ubuntu-server-jammy'
    Skus = '22_04-lts-gen2'
    Version = 'latest'    
}
$vmConfig = New-AzVMConfig @vmsz | Set-AzVMOperatingSystem @vmos -Linux | Set-AzVMSourceImage @vmimage | Add-AzVMNetworkInterface -Id $nicVM.Id

### Create the VM-
$vm = @{
    ResourceGroupName = 'dev-test'
    Location = 'eastus2'
    VM = $vmConfig
}
New-AzVM @vm

```
