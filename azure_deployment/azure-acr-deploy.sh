# Set location name
REGION_NAME=eastus2
RESOURCE_GROUP=aksworkshop

# Set an unique ACR name
ACR_NAME=acr28102021

# Create the ACR instance
az acr create \
    --resource-group $RESOURCE_GROUP \
    --location $REGION_NAME \
    --name $ACR_NAME \
    --sku Standard