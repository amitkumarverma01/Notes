## Create and delete a Resource group--

### Create a resorce group--
``` 
az group create --name GroupName --location eastus
```
- example-
``` 
az group create -name DevOps-AZ -location eastus
az group create -n DevOps-AZ -l centralindia
```

### Know the azure regions--
``` 
az account list-locations -o table
```

### Set the Resource Group as default (Optional)--
``` 
az config set defaults.group=DevOps-AZ
```


### Delete the Resource Group to delete all the resources
- az group delete --name az-cli



