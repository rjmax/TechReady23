Param(
    [string] [Parameter(Mandatory=$true)] $TemplateFile,
    [string] $TemplateParametersFile,
    [string] [Parameter(Mandatory=$true)] $rg
    )

if($TemplateParametersFile){
    Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParametersFile -Verbose
}
else{
    Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $TemplateFile -Verbose
}