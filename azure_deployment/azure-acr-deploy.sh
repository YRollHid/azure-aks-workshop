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

# Build the ratings-api image
BUILDIR=$1
cd $BUILDIR

az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-api:v1 .