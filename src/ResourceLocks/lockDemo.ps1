$TemplateUri = "https://raw.githubusercontent.com/rjmax/TechReady23/master/src/ResourceLocks/lockDemo.json"

#Create resource group
New-AzureRmResourceGroup -Name LockDemo -Location westus -Force

#Deploy storage account and lock it
New-AzureRmResourceGroupDeployment -ResourceGroupName LockDemo -TemplateUri $TemplateUri 