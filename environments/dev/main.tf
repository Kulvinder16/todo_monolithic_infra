# module "rgs" {
#   source          = "../child_module/resource_groups"
#   resource_groups = var.resource_groups

# }

# # module "stgs" {
# #   source = "../child module/storage_account"
# #   storage_accounts = var.storage_accounts  
# # }

# module "vnets" {
#   source = "../child_module/v_net"
#   vnets = var.vnets
# }

module "pip" {
  source = "../../modules/azurerm_public_ip"
  pip    = var.pip

}