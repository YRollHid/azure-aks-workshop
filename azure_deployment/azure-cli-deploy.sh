# Create a new resource group
REGION_NAME=eastus2
RESOURCE_GROUP=aksworkshop
SUBNET_NAME=aks-subnet
VNET_NAME=aks-vnet

az group create --name $RESOURCE_GROUP --location $REGION_NAME
