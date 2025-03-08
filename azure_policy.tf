resource "azurerm_policy_definition" "deny_public_ip" {
  name         = "deny-public-ip-vm"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny Public IP on Virtual Machines"
  description  = "Ensures that VMs do not have public IPs."

  policy_rule = <<POLICY
{
  "if": {
    "allOf": [
      {
        "field": "Microsoft.Network/publicIPAddresses/ipAddress",
        "exists": "true"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICY
}

resource "azurerm_policy_assignment" "deny_public_ip_assignment" {
  name                 = "deny-public-ip-assignment"
  policy_definition_id = azurerm_policy_definition.deny_public_ip.id
  scope                = "/subscriptions/${var.subscription_id}"
}
