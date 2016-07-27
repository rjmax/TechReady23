#Create a resource group
$rg = New-AzureRmResourceGroup -Location WestUs -Name myDepartmentGroup -Force

#get policy content
$appendTagValues = Get-Content .\appendTagValues.json | Out-String
$appendTags =  Get-Content .\appendTags.json | Out-String

#create the policy definitions
$appendTagValuesPolicy = New-AzureRmPolicyDefinition -Name "AppendTagValues" -Description "Adds a departmental tag to user-provided tags" -Policy $appendTags
$appendTags = New-AzureRmPolicyDefinition -Name "AppendTags" -Description "Adds a departmental tag if no tags exist" -Policy $appendTagValues

#we will assign the policy to myDepartmentGroupScope
$scope = $rg.ResourceId

#create the policy assignment
New-AzureRmPolicyAssignment -Name "AppendDepartmentTagValues" -PolicyDefinition $appendTagValuesPolicy -Scope $scope
New-AzureRmPolicyAssignment -Name "AppendDepartmentTags" -PolicyDefinition $appendTags -Scope $scope

$random = get-random

#create a storage account without specifying tags.  Note that the account has tags!
New-AzureRmStorageAccount -ResourceGroupName $rg.ResourceGroupName -Name $random -Location $rg.Location -SkuName Standard_LRS

#cleanup the storage account and assignments
Remove-AzureRmStorageAccount -ResourceGroupName $rg.ResourceGroupName -Name $random
Remove-AzureRmPolicyAssignment -Name "AppendDepartmentTagValues" -Scope $scope
Remove-AzureRmPolicyAssignment -Name "AppendDepartmentTags" -Scope $scope