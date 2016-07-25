$TemplateUri = "https://raw.githubusercontent.com/rjmax/TechReady23/master/src/ResourceLocks/lockDemo.json"

#Create resource group
New-AzureRmResourceGroup -Name LockDemo -Location westus -Force

$deploymentName = (Get-Date).ToString()

#Deploy storage account and lock it
$deployment = New-AzureRmResourceGroupDeployment -ResourceGroupName LockDemo -TemplateUri $TemplateUri -Name $deploymentName

#Get the storage account we just created