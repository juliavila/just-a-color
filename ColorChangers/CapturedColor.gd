extends Area2D

func _on_captured_color_body_entered(body):
	
	var my_group = get_groups()[0]
	var	body_group = body.get_groups()[0]
	
	add_to_group(body_group)
	remove_from_group(my_group)
	
	body.add_to_group(my_group)
	body.remove_from_group(body_group)
	