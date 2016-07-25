$TemplateUri = "https://raw.githubusercontent.com/rjmax/TechReady23/master/src/ResourceLocks/lockDemo.json"

#Create resource group
New-AzureRmResourceGroup -Name LockDemo -Location westus -Force

$deploymentName = Get-Random

#Deploy storage account and lock it
$deployment = New-AzureRmResourceGroupDeployment -ResourceGroupName LockDemo -TemplateUri $TemplateUri -Name $deploymentName

#echo Deployment info
$deployment

#Get the name of the storage account we just created
$name = $deployment.Outputs.name.Value

#Try to delete the storage account - this will fail
Write-Host "Trying to delete the storage account"
Remove-AzureRmStorageAccount -ResourceGroupName LockDemo -Name $name

#See if the storage account still exists
Write-Host "Does it exist?"
if(Find-AzureRmResource -ResourceGroupNameContains LockDemo -ResourceType Microsoft.Storage/storageAccounts){write-host "Yes"} else{write-host "No"}

#Remove the lock
Write-Host "Removing the lock"
Remove-AzureRmResourceLock -LockName myLock -ResourceGroupName LockDemo -ResourceType Microsoft.Storage/storageAccounts -ResourceName $name -Force

start-sleep 10

#Try to delete the storage account - this will succeed
Write-Host "Trying to delete the storage account"
Remove-AzureRmStorageAccount -ResourceGroupName LockDemo -Name $name

#See if the storage account still exists
Write-Host "Does it exist?"
if(Find-AzureRmResource -ResourceGroupNameContains LockDemo -ResourceType Microsoft.Storage/storageAccounts){write-host "Yes"} else{write-host "No"}