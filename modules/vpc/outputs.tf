output "vpc_id" {
  value = module.vpc.vpc_id
}
 
output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}
 
output "vpc_master_subnets" {
  value = module.vpc.master_subnets
}
 
output "vpc_worker_subnets" {
  value = module.vpc.worker_subnets
}

output "vpc_internet_subnet" {
  value = module.vpc.internet_subnet
}