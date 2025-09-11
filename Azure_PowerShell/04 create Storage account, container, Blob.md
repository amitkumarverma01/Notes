## 1- Create AZ Storage account using PowerShell--
### Sign in to Azure
``` 
Connect-AzAccount
```
### Create a Resource Group-
``` 
New-AzResourceGroup -Name myrg -Location westus
```
- you can use -n , -l for name and location fields.
### Create AZ Storage Account--
To Create Azure Storage Account run the below code in PowerShell:
``` 
New-AzStorageAccount -ResourceGroupName MyResourceGroup -Name mystorageaccount -Location westus -SkuName Standard_GRS -MinimumTlsVersion TLS1_2
```
> **Note:** The `MinimumTlsVersion TLS1_2` is required.

### Create a Blob Storage account with BlobStorage Kind and hot AccessTier--
``` 
New-AzStorageAccount -ResourceGroupName MyResourceGroup -Name mystorageaccount -Location westus -SkuName Standard_GRS -Kind BlobStorage -AccessTier Hot
```
### Create a Storage account with Kind StorageV2, and Generate and Assign an Identity for Azure KeyVault--
``` 
New-AzStorageAccount -ResourceGroupName MyResourceGroup -Name mystorageaccount -Location westus -SkuName Standard_GRS -Kind StorageV2 -AssignIdentity
```


---
## 2- Create Storage Account, container and blob using PowerShell & Variables-
### Set variables-
``` 
$rg_name = "My_rg_akkc"
$location = "EastUS"
$s_acc_name = "mystorageaccountakkc"
$container_name ="my_container1"
```
### Create resource group
``` 
New-AzResourceGroup -Name $rg_name -Location $location
```
### Create storage account
``` 
New-AzStorageAccount -ResourceGroupName $rg_name -Name $s_acc_name -Location $location -AllowBlobPublicAccess $true -SkuName "Standard_LRS" -Kind "StorageV2"
```
### Create a container--
``` 
$ctx = New-AzStorageContext -StorageAccountName $s_acc_name -UseConnectedAccount
New-AzStorageContainer -Name $container_name -Context $ctx -AllowBlobPublicAccess $true
```
### Set container public access level-
``` 
- Set-AzStorageContainerAcl -Name "$container_name" -Context $ctx -PublicAccess Blob
```
### Upload the blobs to the container-
``` 
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rg_name -Name $s_acc_name
$a_ctx = $storageAccount.Context
$filePath = "E:/wall/3.jpeg"
Set-AzStorageBlobContent -File $filePath -Container $container_Name -Context $a_ctx
```
### Delete/Clean up resources--
``` 
Remove-AzResourceGroup -Name $ResourceGroup
```
---

## Upload blobs to the container--
### upload a file to the default account (inferred) access tier
``` 
$Blob1HT = @{
  File             = 'E:/wall/3.jpeg'
  Container        = $Container_Name
  Blob             = "3.jpeg"
  Context          = $ctx
  StandardBlobTier = 'Hot'
}
Set-AzStorageBlobContent @Blob1HT
  ```
 ### upload another file to the Cool access tier
 ``` 
 $Blob2HT = @{
  File             = 'D:\Images\Image002.jpg'
  Container        = $ContainerName
  Blob             = 'Image002.png'
  Context          = $Context
  StandardBlobTier = 'Cool'
 }
 Set-AzStorageBlobContent @Blob2HT
  ```

### 3- upload a file to a folder to the Archive access tier
``` 
$Blob3HT = @{
  File             = 'D:\Images\FolderName\Image003.jpg'
  Container        = $ContainerName
  Blob             = 'FolderName/Image003.jpg'
  Context          = $Context
  StandardBlobTier = 'Archive'
}
Set-AzStorageBlobContent @Blob3HT
```

## List the blobs in a container--
``` 
Get-AzStorageBlob -Container $ContainerName -Context $Context |
  Select-Object -Property Name
```
  
## Download blobs-
### Download first blob
``` 
$DLBlob1HT = @{
  Blob        = 'Image001.jpg'
  Container   = $ContainerName
  Destination = 'D:\Images\Downloads\'
  Context     = $Context
}
Get-AzStorageBlobContent @DLBlob1HT
```
### Download another blob
``` 
$DLBlob2HT = @{
  Blob        = 'Image002.png'
  Container   = $ContainerName
  Destination = 'D:\Images\Downloads\'
  Context     = $Context  
}
Get-AzStorageBlobContent @DLBlob2HT

```
---

# Notes--
``` 
$rg_name = "My_rg_akkc11"
$location = "EastUS"
$s_acc_name = "mystorageaccountakkc11"
$container_name ="mycontainer11"
New-AzResourceGroup -Name $rg_name -Location $location
New-AzStorageAccount -ResourceGroupName $rg_name -Name $s_acc_name -Location $location -AllowBlobPublicAccess $true -SkuName "Standard_LRS" -Kind "StorageV2"
$ctx = New-AzStorageContext -StorageAccountName $s_acc_name -UseConnectedAccount
New-AzStorageContainer -Name $container_name -Context $ctx
Set-AzStorageContainerAcl -Container $container_name -Context $ctx -PublicAccess container
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rg_name -Name $s_acc_name
$a_ctx = $storageAccount.Context
$filePath = "E:/wall/3.jpeg"
Set-AzStorageBlobContent -File $filePath -Container $container_Name -Context $a_ctx

```
---

``` 

$rg_name = "AKKC_RG"
$location = "EastUS"
$s_acc_name = "akkcmystorageaccount"
$container_name ="container1"
New-AzResourceGroup -Name $rg_name -Location $location
New-AzStorageAccount -ResourceGroupName $rg_name -Name $s_acc_name -Location $location -AllowBlobPublicAccess $true -SkuName "Standard_LRS" -Kind "StorageV2"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rg_name -Name $s_acc_name
$s_ctx = $storageAccount.Context
New-AzStorageContainer -Name $container_name -Permission Off -Context $s_ctx
Get-AzStorageContainerAcl -Container $containe_name -Context $s_ctx
Set-AzStorageContainerAcl -Container $container_name -Permission Container -Context $s_ctx
Get-AzStorageContainerAcl -Container $container_name -Context $s_ctx
$filePath = "E:/wall/3.jpeg"
Set-AzStorageBlobContent -File $filePath -Container $container_Name -Context $s_ctx
Get-AzStorageContainer -Context $ctx | Select Name, PublicAccess
```
