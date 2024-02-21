extends Control


func _process(delta):
	$Score.text = str(GLOBAL.score)
	$Best.text = str(GLOBAL.best)



func _on_ok_button_pressed():
	$"../Jugador".position.y = 70
	get_tree().paused = false
	$"..".call("live")
	GLOBAL.score = 0
	GLOBAL.graviton = 0

