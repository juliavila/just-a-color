extends KinematicBody2D

onready var tile_color = get_node("")

var input_direction = 0
var direction = 0

var speed_x = 0
var speed_y = 0
var velocity = Vector2()

const MAX_SPEED = 60000
const ACCELERATION = 10000
const DECELERATION = 20000

const JUMP_FORCE = 500
const GRAVITY = 500

func _ready():
	pass
	
#func _input(event):
#	if event.is_action_pressed("ui_up"):
#		velocity.y += -JUMP_FORCE * delta
		

func _physics_process(delta):
	
	if input_direction:
		direction = input_direction
		
	if Input.is_action_just_pressed("ui_up"):
		#speed_y = -JUMP_FORCE * delta
		#velocity.y += -JUMP_FORCE * delta
		print(speed_y)
		
	input_direction = get_direction()
	
	velocity.x = calc_velocity_x(delta)
	
	#speed_y += GRAVITY * delta
	velocity.y += GRAVITY * delta
	
	print(speed_y)
	
	move_and_slide(velocity)
	
func get_direction():
	
	if Input.is_action_pressed("ui_left"):
		return -1
	elif Input.is_action_pressed("ui_right"):
		return 1
	
	return 0
	
func calc_velocity_x(delta):
	
	if input_direction == -direction:
		speed_x /= 3
		
	if input_direction:
		speed_x += ACCELERATION * delta
	else: 
		speed_x -= DECELERATION * delta
		
	speed_x = clamp(speed_x, 0, MAX_SPEED)
	
	return speed_x * delta * direction
	
	