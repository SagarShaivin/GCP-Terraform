# module "data-block1" {
#   source = "./modules/data-block"
#   existing_instance_name = "shaivin-compliance-test3"
#   az = var.az
# }

module "firewall-1" {
  source = "./modules/firewall"

  firewall_name = "custom-ports-instance-1"
  network = module.vpc-1.vpc_name
  protocol = "tcp"
  ports = ["22", "80", "443"]
  source_range = ["0.0.0.0/0"]
  target_tags= ["tag-1"]
}


module "test-instance1" {
  source = "./modules/compute"
  instance_name = "shaivin-test4"
  instance_type = "e2-medium"
  az = var.az
  instance_image = "shaivin-compliance-image"
  network = module.vpc-1.vpc_name
  subnetwork = module.vpc-1.private_subnet1
  ssh_user = var.ssh_user
  ssh_public_key = var.ssh_public_key
  instance_tag = ["tag-1"]
}

module "vpc-1" {
  source = "./modules/vpc"
  vpc_name = "vpc-test"
  project = var.project_id
  private_subnet_cidr = var.private_subnet_cidr
  region = var.region
}

