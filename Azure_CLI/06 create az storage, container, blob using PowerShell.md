### Create AZ Storage Account, Container And Blob using Variables--
1. -
``` 
$rg_name ="AKKC_B17_G22"
$location ="eastus"
$name ="akcontainer1"
$saccount_name ="akkcstorageb17g22"
$path = "D:/Akkc/wall/20.jpg"
az group create --name $rg_name -l $location
az storage account create --name $saccount_name --resource-group $rg_name --kind StorageV2 --location $location --sku Standard_LRS --allow-blob-public-access true
az storage container create --account-name $saccount_name --name $name
az storage container set-permission --name $name --account-name $saccount_name --public-access container
az storage account keys list --account-name $saccount_name --resource-group $rg_name --query "[0].value" --output table
az storage blob upload --account-name $saccount_name --container-name $name --name RDJ --file $path --account-key <$your-storage-key>
```

2. 
``` 
$rg_name ="AKKC_B17_G2"
$location ="eastus"
$name ="akkc"
$saccount_name ="akkcstorageb17g2"
$path = "E:/wall/rdj.jpg"
az group create --name $rg_name -l $location
az storage account create --name $saccount_name --resource-group $rg_name --kind StorageV2 --location $location --allow-blob-public-access true
az storage container create --account-name $saccount_name --name $name --auth-mode login
az storage container set-permission --name $name --account-name $saccount_name --public-access container
set AZURE_STORAGE_ACCOUNT =$saccount_name
az storage account keys list --account-name $saccount_name --resource-group $rg_name --output table
set AZURE_STORAGE_ACCESS_KEY= <your account key>
az storage account show-connection-string --name $saccount_name --resource-group $location --output table
az storage blob upload --account-name $saccount_name --container-name $name --name RDJ --file "E:/wall/rdj.jpg"

```

