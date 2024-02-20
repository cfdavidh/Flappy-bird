extends Control


func _on_ok_button_pressed():
	$"../Jugador".position.y = 70
	get_tree().paused = false
	$"..".call("live")

