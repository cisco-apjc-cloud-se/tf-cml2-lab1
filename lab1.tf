resource "cml2_lab" "tf-ndfc-vxlan-lab1" {
  title       = "Terraform NDFC VXLAN Lab 1"
  description = "NXOS-based VXLAN EVPN Multi-Site Lab built from NDFC via POAP"
#   notes       = <<-EOT
#   # Heading
#   - topic one
#   - topic two
#   EOT
}

resource "cml2_node" "nodes" {
    for_each = var.nodes

    lab_id              = cml2_lab.tf-ndfc-vxlan-lab1.id
    label               = each.key
    nodedefinition      = each.value.nodedefinition
    imagedefinition     = each.value.imagedefinition
    configuration       = each.value.configuration
    # boot_disk_size
    # cpu_limit
    # cpus
    # data_volume
    # ram
    # tags
    x              = each.value.x
    y              = each.value.y
}

resource "cml2_link" "links" {
    for_each = var.links

    lab_id = cml2_lab.tf-ndfc-vxlan-lab1.id
    node_a = each.value.node_a
    slot_a = each.value.slot_a
    node_b = each.value.node_b
    slot_b = each.value.slot_b
}