variable "vms" {
    type = map(object({
      nic_name = "todo-infra-nic"
      location = "central india"
      resource_group_name = "rg_1"
      vm_name = "frontend_vm"
      
    }))
  
}