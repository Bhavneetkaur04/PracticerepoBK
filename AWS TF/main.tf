module "ec2_module" {
    source = "./Modules/Module_ec2"
    ami_value = "ami-09024b009ae9e7adf"
    instance_type = "t2.micro"
    security_group_id = [module.vpc_module.security_group_id]
    subnet_id = module.vpc_module.subnet_id
}

module "s3_module" {
    source = "./Modules/Module_s3"
}

module "dynamo_db" {
    source = "./Modules/Module_dynamodb"
}

module "vpc_module" {
    source = "./Modules/Module_vpc"
    cidr = "10.0.0.0/16"
}