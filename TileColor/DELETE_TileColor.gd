extends KinematicBody2D

enum DIR { x = 0, y = 1 }
enum ACTION { stop = 0, increase = 1, decrease = -1 }

var direction #= DIR.y # DIR 
var increase = 0#256
var decrease = 0#192
var speed = 0#5000

var action = ACTION.stop

var posIncreased = Vector2()
var posDecreased = Vector2()

func _ready():
	
	var initial_position = global_position.x if (direction == DIR.x) else global_position.y
	
	posIncreased = initial_position + increase
	posDecreased = initial_position - decrease
	
	action = ACTION.increase;

func _process(delta):
	
	if action == ACTION.stop:
		return
		
	var velocity = Vector2()
	
	var actual_position = global_position.x if (direction == DIR.x) else global_position.y
	
	#if (action == ACTION.increase && actual_position >= posIncreased) or (action == ACTION.decrease && actual_position <= posDecreased):
	if actual_position >= posIncreased or actual_position <= posDecreased:
		action *= -1;
			
	var vel = speed * action
	
	if direction == DIR.x:
		velocity.x = vel
	elif direction == DIR.y:
		velocity.y = vel
	
	move_and_slide(velocity * delta)