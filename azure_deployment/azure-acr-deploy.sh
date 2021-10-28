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
BUILDAPIDIR=$1
cd $BUILDAPIDIR

az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-api:v1 .

# Build the ratings-web image
BUILDWEBDIR=$2
cd $BUILDWEBDIR

az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-web:v1 .