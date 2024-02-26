extends Node

var axis: Vector2


func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = - int(Input.is_action_just_pressed("ui_accept"))
	
	return axis.normalized()


var score = 0 
var best =  0


var graviton = 0

func graviton_active():
	if Input.is_action_just_pressed("ui_accept"):
		graviton += 1 
	return graviton
 
