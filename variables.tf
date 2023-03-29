variable "name" {
  description = "name of the rsourse grp"
  default     = "2MPSSR-DS"
}
variable "location" {
  description = "the location of our vpc"
  default     = "francecentral"
}
variable "username" {
  description = "the username of user"
  default     = "baderuser"

}
variable "password" {
  description = "the password of user"
  default     = "***********"

}
variable "namecontainer" {
  description = "name of the conatiner"
  default     = "az-storage-container-test"

}
variable "nameaccount" {
  description = "name of the account storage"
  default     = "azstorageacc1test"

}
variable "ad_space" {
  description = "la plage des adress du resaux"
  default     = ["10.0.0.0/16"]

}
variable "prefix1" {
  description = "la plages des adress pour le sous-resau du test"
  default     = ["10.0.1.0/24"]

}
variable "prefix2" {
  description = "la plages des adress pour le sous-resau du test2"
  default     = ["10.0.2.0/24"]

}
variable "prefix3" {
  description = "la plages des adress pour le sous-resau du test3"
  default     = ["10.0.3.0/24"]

}
