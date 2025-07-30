module "storage_account" {
   source  = "app.terraform.io/my-harshit-tf-org/storageaccount/azurerm"
  version = "1.0.1"

  name_prefix             = "st"
  name_suffix             = "myapp-prod"
  resource_group_name     = "RG1"
  location                = "eastus"
  account_tier            = "Standard"
  account_replication_type = "GRS"
  allow_blob_public_access = false
  containers              = ["data", "logs", "backups"]

  network_rules = {
    default_action             = "Deny"
    ip_rules                   = ["123.123.123.123"]
    virtual_network_subnet_ids = ["/subscriptions/b03ba61c-ebe2-4252-9a93-7603e3176b3d/resourceGroups/RG1/providers/Microsoft.Network/virtualNetworks/Vnet01/subnets/default"]
    bypass                     = ["AzureServices"]
  }

  tags = {
    Application = "MyApp"
    Owner       = "DevOps"
  }
}
