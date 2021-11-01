# Set variables
AKS_CLUSTER_NAME=${AKSCLUSTERNAME}
ACR_NAME=${ACRNAME}
REGION_NAME=${AZREGION}
RESOURCE_GROUP=${AKSRG}


# Create the ACR instance
az acr create \
    --resource-group $RESOURCE_GROUP \
    --location $REGION_NAME \
    --name $ACR_NAME \
    --sku Standard

# Build the ratings-api image
BUILDAPIDIR=${PATHRATINGSAPI}
cd $BUILDAPIDIR

az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-api:v1 .

# Build the ratings-web image
BUILDWEBDIR=${PATHRATINGSWEB}
cd $BUILDWEBDIR

az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-web:v1 .

# Verify the images
az acr repository list \
    --name $ACR_NAME \
    --output table

# Configure the AKS cluster to authenticate to the container registry
az aks update \
    --name $AKS_CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --attach-acr $ACR_NAME