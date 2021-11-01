az aks get-credentials -g ${AKSRG} -n ${AKSCLUSTERNAME} --admin

ip=""
while [ -z $ip ]; do
  echo "Waiting for external IP"
  ip=$(kubectl get svc nginx-ingress-ingress-nginx-controller --namespace ingress --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
  [ -z "$ip" ] && sleep 10
done
echo 'Found external IP: '$ip

echo ${AZURE_DEVOPS_CLI_PAT} | az devops login

az devops configure --defaults organization=https://dev.azure.com/${AZORG} project=${AZPROJECT} --use-git-aliases true

az pipelines variable-group variable update --group-id ${AZGROUPID} --name 'frontendIP' --value $ip