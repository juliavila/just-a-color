extends Node2D

func _enter_tree():
	$MobileTileColor.direction = 1
	$MobileTileColor.increase = 256
	$MobileTileColor.decrease = 192
	$MobileTileColor.speed = 8000

func _ready():
	pass
