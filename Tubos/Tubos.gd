extends Node2D



func _physics_process(delta):
	position.x += -50 * delta


func _on_tubo_arriba_body_entered(body):
	var pepe = get_tree().get_nodes_in_group("hud")
	for i in pepe:
		i.show()
	get_tree().paused = true


func _on_tubo_abajo_body_entered(body):
	var pepe = get_tree().get_nodes_in_group("hud")
	for i in pepe:
		i.show()
	get_tree().paused = true
