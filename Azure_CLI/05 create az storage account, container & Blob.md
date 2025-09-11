# Create container and blob using cmd--

### Create a Resources Group--
``` 
az create group -name B17_G2_AKKC -l centralindia
```
### create Storage Account--
``` 
az storage account create --name storageb17g2akkc --resource-group B17_G2_AKKC --location centralindia --sku Standard_ZRS --encryption-services blob
az storage account create --name storageb17g2akkc11 --resource-group B17_G2_AKKC --kind StorageV2 --location centralindia --allow-blob-public-access true
az storage account list -g B17_G2_AKKC
az storage account show --name storageb17g2akkc11 --resource-group B17_G2_AKKC --query allowBlobPublicAccess --output tsv
```

### Create the container--
``` 
az storage container create --account-name storageb17g2akkc --name akkc --auth-mode login --allow-blob-public-access true
az storage container list --account-name storageb17g2akkc --auth-mode login -o table
az storage container set-permission --name akkc1 --account-name storageb17g2akkc11 --public-access container --auth-mode key not //tested
az storage container set-permission --name akkc --account-name storageb17g2akkc11 --public-access container
az storage container show-permission --name akkc1 --account-name storageb17g2akkc11 --account-key <account-key> --auth-mode key //not tested
az storage container show-permission --name akkc1 --account-name storageb17g2akkc11 --auth-mode key
```
## set environment & Permissions--
``` 
az storage account keys list --account-name storageb17g2akkc11 --resource-group B17_G2_AKKC --output table
set AZURE_STORAGE_ACCOUNT =storageb17g2akkc11
#set AZURE_STORAGE_ACCESS_KEY="yourkey"
az storage account show-connection-string --name storageb17g2akkc11 --resource-group centralindia --output table 
```
### Blob Upload --
``` 
az storage blob upload --account-name storageb17g2akkc11 --container-name akkc --name rdj.jpg --file "E:/wall/rdj.jpg" --auth-mode login ///
az storage blob upload --account-name storageb17g2akkc11 --container-name akkc --name rdj.jpg --file "E:/wall/rdj.jpg"
az storage blob list --account-name storageb17g2akkc11 --container-name akkc -o table
```
### Blob Delete--
``` 
az storage blob list --account-name $saccount_name --container-name $name -o table
az storage blob delete --account-name $saccount_name --container-name $name --name rdj.jpg
```

### Check the anonymous access setting for a set of containers--
``` 
$rgName = "B17_G2_AKKC"
$accountName = "storageb17g2akkc11"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rgName -Name $accountName
$ctx = $storageAccount.Context
```

### Delete az storage container--
``` 
az storage container delete --account-key 00000000 --account-name storageb17g2akkc11 --name akkc1 //noty tested
az storage container delete --account-name storageb17g2akkc11 --name akkc1
```

### az storage container exists--
``` 
az storage container exists --account-name mystorageccount --account-key 00000000 --name mycontainer
```

## use this single command--
``` 
az create group -name B17_G2_AKKC -l centralindia
az storage account create --name storageb17g2akkc11 --resource-group B17_G2_AKKC --kind StorageV2 centraindia --allow-blob-public-access true
az storage container create --account-name storageb17g2akkc --name akkc --auth-mode login
az storage container set-permission --name akkc --account-name storageb17g2akkc11 --public-access container
az storage account keys list --account-name storageb17g2akkc11 --resource-group B17_G2_AKKC --output table
set AZURE_STORAGE_ACCOUNT =storageb17g2akkc11
#set AZURE_STORAGE_ACCESS_KEY="yourkey"
az storage account show-connection-string --name storageb17g2akkc11 --resource-group centralindia --output table 
az storage blob upload --account-name storageb17g2akkc11 --container-name akkc --name rdj.jpg --file "E:/wall/rdj.jpg"
az storage blob list --account-name storageb17g2akkc11 --container-name akkc -o table
az storage blob delete --account-name storageb17g2akkc11 --container-name akkc --name rdj.jpg
```
