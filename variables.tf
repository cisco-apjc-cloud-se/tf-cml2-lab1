variable "cml2_url" {
  type = string
}

variable "cml2_username" {
  type = string
}

variable "cml2_password" {
  type      = string
  sensitive = true
}

variable "nodes" {
  type = map(object({
    nodedefinition = string
    imagedefinition = string
    x = number
    y = number
  }))
}

variable "links" {
  type = map(object({
    node_a = string
    slot_a = number
    node_b = string
    slot_b = number
  }))
}