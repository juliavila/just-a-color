extends Node2D

var color = Color(0, 1, 1);

func _ready():
	$Sprite.modulate = color;

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
