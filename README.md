# UDEMY_DevOps_Terraform

### Terraform Command Overview
* Terraform is very much focuessed on the resource definitions
* It has a <b><limited toolset</b> available to modify, import, create these resources definitions

| Command | Description |
| --- | --- |
| terraform apply | Applies state |
| terraform destroy | Destroys all terraform managed state <b>(user w/ caution)</b> |
| terraform fmt| Rewrite terraform configuration files to a canonical format and style|
| terraform get| Download and update modules |
|terraform graph| Creates a visual representation of a configuration or execution plan|
|terraform import [options] ADDRESS ID|Import will try and find the infrastructure resource identified with ID and import the state into terraform.tfstate with resource id ADDRESS|
|terraform, [options] [NAME]| Output any of your resources. Using NAME will only output a specific resource|
|terraform plan|terraform plan, show the changes TO BE made to the infrastructure|
|terraform refresh|Refresh the remote state. Can identify differences between state file and remote state|
|terraform remote|Configure remote state storage|
|terraform show|Show human readable output from a state or a plan|
|terraform state|Use this command for advanceed state management|
|terraform taing|Manually mark a resource as tainted, meaning it will be destructed and recreated at the next apply|
|terraform validate|validate your terraform syntax|
|terraform untaint|undo a taint|
