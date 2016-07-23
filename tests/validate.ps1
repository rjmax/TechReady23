Param(
    [string] [Parameter(Mandatory=$true)] $TemplateFile,
    [string] [Parameter(Mandatory=$true)] $rg
    )

Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $TemplateFile -Verbose
