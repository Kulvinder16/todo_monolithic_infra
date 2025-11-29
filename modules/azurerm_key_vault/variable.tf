variable "kv" {
    type = map(object({
  kv_name = string
  location = string
  resource_group_name = string
  sp_object_id = string
 } ))

}