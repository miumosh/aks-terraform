locals {
  service_name = "myksys"
  region       = "Japan East"
}



variable env {}
variable subscription_id {}

variable network {
  default = {
    main = {
      vnet = ""
    }
  }
}