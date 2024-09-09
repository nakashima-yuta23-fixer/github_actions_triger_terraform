module "container_registry" {
  source              = "git::https://github.com/nakashima-yuta23-fixer/TerraformCommonModules.git//container_registry?ref=main"
  product_name        = "nytes1"
  env                 = "dev"
  resource_group_name = var.resource_group_name
  location            = "japaneast"
}
