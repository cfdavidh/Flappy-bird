extends CharacterBody2D


const SPEED = 300.0
var gravity = 0
const JUMP = 20000


func _ready():
	$Sprite2D/AnimationPlayer.play("idle")




var my_delta
var weigth = 0.01 

func _physics_process(delta):
	my_delta = delta
	
	
	if GLOBAL.graviton_active() != 0:
		$Sprite2D/AnimationPlayer.play("fly")
		
		if Input.is_action_just_pressed("ui_accept"):
			$Flap.play()
		
		gravity = 600
		motion_control()
	else:
		$Flap.stop()
	
	if velocity.y > 10:
		for i in 100:
			if weigth <= 1:
				$Sprite2D.rotation = lerp_angle(0, deg_to_rad(20), weigth)
				weigth += 0.01
				
		weigth = 0
		
	elif velocity.y < -10:
		for i in 100:
			if weigth <= 1:
				$Sprite2D.rotation =  lerp_angle(0, deg_to_rad(-30), weigth)
				weigth += 0.01
		weigth = 0
		
	elif velocity.y <= 10 and velocity.y >= -10 :
		$Sprite2D.rotation = 0
	




func motion_control():
	velocity.y +=  gravity * my_delta
	velocity.y += (GLOBAL.get_axis().y * JUMP * my_delta)
	#velocidad maxima
	if velocity.y > 300:
		velocity.y = 300
	if velocity.y < -200:
		velocity.y = -200
	move_and_slide()


func reset_idle_animation():
	$Sprite2D/AnimationPlayer.play("idle")
	
