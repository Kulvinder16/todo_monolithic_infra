variable "vms" {
    type = map(object({
      pip_name= string
      subnet_name = string
      v_net_name = string
      kv_name = string
      vm_size = string
      nic_name = string
      location = string
      resource_group_name = string
      vm_name = string
      vm_username = string
      vm_password = string
      source_image_reference = map(string)
    }))
  
}