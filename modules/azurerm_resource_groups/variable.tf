variable "resource_groups" {
  description = <<EOT
A map of Resource Groups to create.
Each object supports:
- name (Required): The Resource Group name
- location (Required): The Azure region
- managed_by (Optional): Resource/application ID that manages this RG
- tags (Optional): Map of key-value tags
EOT

  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}