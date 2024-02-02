variable "ami_value"{  
}

variable "instance_type" { 
}

variable "security_group_id" {
    type = list(string)
}

variable "subnet_id" {
}

# variable "count" {
#     type = number
#     default = 2
  
# }

variable "names" {
  default = "Bhavi-"
  
  validation {
    condition     = startswith(var.names, "Bhavi-")
    error_message = "Variable 'names' must start with 'Bhavi-'"
  }
}
