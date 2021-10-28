# Create a new resource group
REGION_NAME=eastus2
RESOURCE_GROUP=aksworkshop
SUBNET_NAME=aks-subnet
VNET_NAME=aks-vnet

az group create --name $RESOURCE_GROUP --location $REGION_NAME

# Configure networking
az network vnet create \
    --resource-group $RESOURCE_GROUP \
    --location $REGION_NAME \
    --name $VNET_NAME \
    --address-prefixes 10.0.0.0/8 \
    --subnet-name $SUBNET_NAME \
    --subnet-prefixes 10.240.0.0/16

# Retrieve the subnet ID
SUBNET_ID=$(az network vnet subnet show \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VNET_NAME \
    --name $SUBNET_NAME \
    --query id -o tsv)