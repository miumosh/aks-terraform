# Create storage space for tfstate
```sh
# Set description
az login
az account list -o table
Sub="従量課金"
SubId=`az account list -o table | grep $Sub | awk '{print $3}'`
az account set -s $SubId
az account show -o table

# Create resource group
TfRg=tfstate
Location=japaneast
az group create -n $TfRg -l $Location

# Create storage account
StgAc=tfstate$RANDOM
Sku=Standard_LRS
az storage account create -g $TfRg -n $StgAc --sku $Sku
AcKey=`az storage account keys list -g $TfRg -n $StgAc --query [0].value -o tsv`
# if prompt zsh, need define "setopt +o nomatch" at ~/.zshrc

# Create storage container in $StgAc
StgContainer=tfstate
$ az storage container create --name $StgContainer --account-name $StgAc --account-key $AcKey
```



# Create service principal for deploy
```sh
SubId=`az account list -o table | grep $Sub | awk '{print $3}'`
Role=Contributor
Sp=sp-terraform
az ad sp create-for-rbac --scopes "/subscriptions/${SubId}" --role $Role -n $Sp