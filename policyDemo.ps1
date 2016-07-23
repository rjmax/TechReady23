﻿$policy = New-AzureRmPolicyDefinition -Name "USOnlyPolicy" -Description "Resource in US Only" -Policy ‘{
  "if": {
    "not": {
      "field": "location",
      "in": [
        "centralus",
        "eastus",
        "eastus2",
        "northcentralus",
        "southcentralus",
        "westus",
        "westcentralus",
        "westus2"
      ]
    }
  },
  "then": {
    "effect": "deny"
  }
}’

$scope = "/subscriptions/9167af2d-c13e-4d34-9a57-8f37dba6ff31”

New-AzureRmPolicyAssignment -Name "USOnlyAssignment" -PolicyDefinition $policy -Scope $scope

New-AzureRmResource -Location westeurope -ResourceName asdf -ResourceGroupName blah -ResourceType Microsoft.Web/sites -Force

