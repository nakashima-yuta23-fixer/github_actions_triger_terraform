include "root" {
  path = find_in_parent_folders()
}

dependency "resource_group" {
  config_path = "../resource_group"

  mock_outputs = {
    resource_group_name = "resource_group_name"
  }
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.resource_group_name
}
