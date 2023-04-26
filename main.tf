terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "mel-ciscolabs-com"
    workspaces {
      name = "cml2-ndfc-lab1"
    }
  }
  required_providers {
    cml2 = {
      source = "CiscoDevNet/cml2"
    }
  }
#   experiments = [module_variable_optional_attrs]
}

### Providers ###
provider "cml2" {
  # for use of variables, see
  # https://developer.hashicorp.com/terraform/language/values/variables

  # address must use https://
  address = var.cml2_url

  # credentials, either a JWT or username/password are required
  # an error is raised if neither token or username / password are set
  # token   = var.token
  username = var.cml2_username
  password = var.cml2_password

  # read the CA certificate from file
  # if not specified, the system root CAs are used
  # cacert = file("ca.pem")

  # should the server certificate be verified?
  # (defaults to false, it will be verified)
  skip_verify = true

  # should the API client cache responses?
  # this will improve performance but isn't guaranteed
  # to work for all scenarios
  # (defaults to false, no caching is done)
  # use_cache = true
}