package terraform

import future.keywords.in

allowed_instance_types := {"t3.micro", "t3.small"}

deny[msg] {
  some resource in input.resource_changes
  resource.type == "aws_instance"
  instance_type := resource.change.after.instance_type
  not instance_type in allowed_instance_types
  msg := sprintf("AWS instance type '%s' is not allowed. Only 't3.micro' or 't3.small' are permitted.", [instance_type])
}