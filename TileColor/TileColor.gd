extends Node2D

onready var colors = get_node("/root/Colors")
var color

func _ready():
	if is_in_group("red") : color = colors.colorPalette[colors.RED]
	if is_in_group("seaGreen") : color = colors.colorPalette[colors.SEA_GREEN]
	if is_in_group("yellow") : color = colors.colorPalette[colors.YELLOW]
	
	$Sprite.modulate = color

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
