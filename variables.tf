variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "appName" {
    type    = string
    default = "deployer"
}

variable "ami" {
    type    = string
    default = "ami-0e1d30f2c40c4c701"
}

variable "key_name" {
    type    = string
    default = "elrond"
}