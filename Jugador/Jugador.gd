extends CharacterBody2D


const SPEED = 300.0
const gravity = 600
const JUMP = 17000

var my_delta
func _physics_process(delta):
	my_delta = delta
	motion_control()


func motion_control():
	velocity.y +=  gravity * my_delta
	velocity.y += (GLOBAL.get_axis().y * JUMP * my_delta)
	#velocidad maxima
	if velocity.y > 300:
		velocity.y = 300
	if velocity.y < -200:
		velocity.y = -200
	move_and_slide()