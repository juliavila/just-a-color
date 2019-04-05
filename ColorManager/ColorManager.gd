extends Node

onready var colors = get_node("/root/Colors")

func _process(delta):
	
	var parent = get_parent()
	var sprite = parent.get_node('Sprite')
	
	if (not parent or not sprite): return
	
	var color = Color()
	
	if   parent.is_in_group("red")      : color = colors.colorPalette[colors.RED]
	elif parent.is_in_group("seaGreen") : color = colors.colorPalette[colors.SEA_GREEN]
	elif parent.is_in_group("yellow")   : color = colors.colorPalette[colors.YELLOW]
	
	sprite.modulate  = (color)