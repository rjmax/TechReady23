Param(
    [string] [Parameter(Mandatory=$true)] $TemplateUri,
    [string] [Parameter(Mandatory=$true)] $TemplateParameterUri,
    [string] [Parameter(Mandatory=$true)] $rg
    )
    
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateUri $TemplateUri -TemplateParameterUri $TemplateParameterUri -Verbose
