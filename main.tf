module "storage_account" {
   source  = "app.terraform.io/my-harshit-tf-org/storageaccount/azurerm"
  version = "1.0.0"

  name_prefix             = "st"
  name_suffix             = "myapp-prod"
  resource_group_name     = azurerm_resource_group.example.name
  location                = "eastus"
  account_tier            = "Standard"
  account_replication_type = "GRS"
  allow_blob_public_access = false
  containers              = ["data", "logs", "backups"]

  network_rules = {
    default_action             = "Deny"
    ip_rules                   = ["123.123.123.123"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
    bypass                     = ["AzureServices"]
  }

  tags = {
    Application = "MyApp"
    Owner       = "DevOps"
  }
}
