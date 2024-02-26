extends Control



func _process(delta):
	$Score.text = str(GLOBAL.score)
	$Best.text = str(GLOBAL.best)
	
	
	var pressed = Input.is_action_just_pressed("n")
	if pressed:
		reset_game()
	




func _on_ok_button_pressed():
	reset_game()

func reset_game():
	get_tree().paused = false
	$"../Jugador".velocity.y = 0 
	$"../Jugador".position.y = 70
	$"..".call("live")
	GLOBAL.score = 0
	GLOBAL.graviton = 0
	$"../Jugador".call("reset_idle_animation")
	

