variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "az" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "instance_tag" {
  type = list(string)
}

