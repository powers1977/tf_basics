# Setup Remote state

# Sign in
```
az login
```

# Create recoursegroup for Terraform state
```
az group create -l southcentralus -n terraform-state 
```

# Create storage account
*Name must be unique across Azure*

```

THIS CAUSED AN ERROR:
az storage account create -g terraform-state -l southcentralus \
  --name tfstorageryan\
  --sku Standard_LRS \
  --encryption-services blob

So I DID IT THIS WAY:
az storage account create --name tfstorageryan --resource-group terraform-state -l southcentralus --sku Standard_LRS --encryption-services blob
```

# List account key & Create storage container

```
az storage account keys list --resource-group terraform-state --account-name tfstorageryan --query [0].value -o tsv
az storage container create --name terraform-state-container --account-name tfstorageryan --account-key REPLACE_WITH_ACCOUNT_KEY
```

# Edit main.tf(backend section)

```
Since storage account names need to be unique don't forget to edit the backend section in the main.tf accordinly to your situation
```

# Init terraform to use remote state
```
terraform init
```

# Generate ssh key
```
ssh-keygen -t rsa -b 4096 -f mykey
```

# Run Terraform apply
```
terraform apply
```

# Inspect Terraform state
```
terraform state list
terraform state show azurerm_virtual_machine.demo-instance
```

# Cleanup Demo
```
terraform destroy
az group delete --name terraform-state --no-wait
```

