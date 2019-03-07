extends StaticBody2D

onready var particle = preload("res://RoundParticles/RoundParticle.tscn")

const SPEED = .5
const RADIUS = 128

var numParticles = 0
var color

var particles_array = []

func _ready():
	
	var center = Vector2(0, 0)	
		
	for i in numParticles:
		
		var particle_instance = particle.instance()
		
		if numParticles == 1 :
			particle_instance.position = center
		elif numParticles > 1:
			particle_instance.position.x = center.x + cos((PI / numParticles) * i * 2) * RADIUS
			particle_instance.position.y = center.y + sin((PI / numParticles) * i * 2) * RADIUS
		
		add_child(particle_instance)
		particles_array.append(particle_instance)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	
	if numParticles > 1:
		rotate(PI * (SPEED * delta))
	