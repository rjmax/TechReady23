#Get Audit Logs for resource group
$logs = Get-AzureRmLog -ResourceGroup KeyVaultDemo

#show one of the events
$logs[0]

#Get Deployment Operations for a specific deployment in the resource group
$operations = Get-AzureRmResourceGroupDeploymentOperation -ResourceGroupName KeyVaultDemo -DeploymentName azuredeploy

#show one of the operations
write-host "id: "$operations[0].id
write-host "operationId: "$operations[0].operationId
$operations[0] | Select -ExpandProperty properties
