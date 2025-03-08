resource "azurerm_policy_remediation" "aks_private_remediation" {
  name                 = "aks-private-remediation"
  policy_assignment_id = azurerm_policy_assignment.aks_private_policy.id
  location_filters     = ["East US"]
  resource_discovery_mode = "ExistingNonCompliant"
}
