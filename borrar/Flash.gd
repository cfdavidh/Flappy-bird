extends ColorRect

func _ready():
	
	var tween : Tween = get_tree().create_tween()
	
	tween.tween_property($".","modulate",Color(1,1,1,0),0.05)
	tween.tween_callback($".".queue_free)
	tween.tween_callback(paused_game)


func paused_game():
	get_tree().paused = true
