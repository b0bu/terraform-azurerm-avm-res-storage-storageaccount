locals {
  blob_endpoint            = length(var.storage_container) == 0 ? [] : ["blob"]
  endpoints                = toset(concat(local.blob_endpoint, local.queue_endpoint, local.table_endpoint, local.file_endpoint))
  private_endpoint_enabled = var.new_private_endpoint != null
  private_endpoints        = local.private_endpoint_enabled ? local.endpoints : toset([])
  queue_endpoint           = length(var.storage_queue) == 0 ? [] : ["queue"]
  table_endpoint           = length(var.storage_table) == 0 ? [] : ["table"]
  file_endpoint           = length(var.storage_share) == 0 ? [] : ["file"]
}