package terraform

import rego.v1

allowed_instance_types := ["t3.micro", "t3.small"]

deny contains msg if {
	some resource in input.resource_changes
	resource.type == "aws_instance"
	instance_type := resource.change.after.instance_type
	not instance_type in allowed_instance_types
	msg := sprintf(
		"instance type for '%s' is '%s', but must be '%s'",
		[resource.address, instance_type, allowed_instance_types],
	)
}