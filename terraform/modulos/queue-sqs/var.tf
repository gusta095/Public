variable "name" {
  default = "gusta-queue"
}
variable "visibility_timeout_seconds" {
  default = "30"
}
variable "delay_seconds" {
  default = "0"
}
variable "message_retention_seconds" {
  default = "1209600"
}
variable "receive_wait_time_seconds" {
  default = "0"
}
