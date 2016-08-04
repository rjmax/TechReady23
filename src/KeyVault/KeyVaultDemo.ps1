param
(
    [Parameter(Mandatory=$true, HelpMessage="Provide a password to store in the KeyVault")]
    [securestring] $password
)

#create the resource group
New-AzureRmResourceGroup -Name KeyVaultDemo -Location westus -Force

#create the keyvault. note that this command is not idempotent.
#$vault = New-AzureRmKeyVault -VaultName TR23 -ResourceGroupName KeyVaultDemo -EnabledForTemplateDeployment -Location westus

#create/set the secret
$secret = Set-AzureKeyVaultSecret -VaultName TR23 -Name MySecret -SecretValue $password

#echo the vault id
Write-Host Vault Id: $vault.ResourceId

#echo the vault secret
Write-Host Secret Id: $secret.Name

$TemplateUri = "https://raw.githubusercontent.com/rjmax/TechReady23/master/src/KeyVault/azuredeploy.json"
$TemplateParameterUri = "https://raw.githubusercontent.com/rjmax/TechReady23/master/src/KeyVault/azuredeploy.parameters.json"

#Deploy using the secret
New-AzureRmResourceGroupDeployment -ResourceGroupName KeyVaultDemo -TemplateUri $TemplateUri -TemplateParameterUri $TemplateParameterUri

#cleanup non-idempotent resources
#Remove-AzureRmKeyVault -VaultName TR23 -ResourceGroupName KeyVaultDemo -Force