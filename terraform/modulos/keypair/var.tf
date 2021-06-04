variable "client_name" {
  type    = string
  default = "gusta-keypair"
}

variable "environment" {
  type    = string
  default = "teste"
}

variable "ssh_public_key_path" {
  type    = string
  description = "Path to Read/Write SSH Public Key File (directory)"
  default     = "."
}

variable "generate_ssh_key" {
  type    = string
  default = "true"
}

variable "ssh_key_algorithm" {
  type    = string
  default = "RSA"
}

variable "private_key_extension" {
  type    = string
  default = ".pem"
}

variable "public_key_extension" {
  type    = string
  default = ".pub"
}