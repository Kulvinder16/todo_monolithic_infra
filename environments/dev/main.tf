# module "rgs" {
#   source          = "../../modules/azurerm_resource_groups"
#   resource_groups = var.resource_groups

# }

# module "stgs" {
#   source = "../../modules/storage_account"
#   depends_on = [ module.rgs ]
#   storage_accounts = var.storage_accounts  
# }

# module "vnets" {
#   source = "../../modules/azurerm-networking"
#   depends_on = [ module.rgs ]
#   vnets = var.vnets
# }

# module "pip" {
#   source = "../../modules/azurerm_public_ip"
#   depends_on = [ module.rgs ]
#   pip    = var.pip

# }

# module "key_vault" {
#   source = "../../modules/azurerm_key_vault"
#   depends_on = [ module.rgs ]
#   kv = var.kv 
# }