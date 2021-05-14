id           = "ebs_prod_db1"
name         = "database"
type         = "csi"
plugin_id    = "aws-ebs"

capacity_max = "10G"
capacity_min = "8G"

capability {
  access_mode     = "single-node-writer"
  attachment_mode = "file-system"
}

mount_options {
  fs_type     = "ext4"
  mount_flags = ["ro"]
}
