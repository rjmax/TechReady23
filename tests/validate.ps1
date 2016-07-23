Param(
    [string] [Parameter(Mandatory=$true)] $TemplateFile,
    [string] [Parameter(Mandatory=$true)] $rg
    )
    
#Get-Module -ListAvailable
#Get-Module -Name AzureRM.Resources

Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $TemplateFile git -Verbose
