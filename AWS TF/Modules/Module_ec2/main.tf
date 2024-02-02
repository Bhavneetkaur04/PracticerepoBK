resource "aws_instance" "Test02" {
    ami = var.ami_value
    instance_type = var.instance_type
    key_name = "TF-TEST"
    security_groups = var.security_group_id
    subnet_id = var.subnet_id
    count = 3
    tags = {
      Name = "${var.names}${random_pet.instances[count.index].id}"
    }
  }

  resource "random_pet" "instances" {
    count = 3
    
  }






