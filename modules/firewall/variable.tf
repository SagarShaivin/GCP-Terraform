variable "firewall_name" {
  type = string
}

variable "network" {
  type = string
}

variable "protocol" {
  type = string
}

variable "ports" {
  type = list(string)
}

variable "source_range" {
  type = list(string)
}

variable "target_tags" {
  type = list(string)
}