extends Node2D



func _physics_process(delta):
	position.x += -50 * delta

@export var flash_scene : PackedScene

func _on_tubo_arriba_body_entered(body):
	$golpe.play()
	var flash = flash_scene.instantiate()
	add_child(flash)
	
	var pepe = get_tree().get_nodes_in_group("hud")
	for i in pepe:
		i.show()
		
	GLOBAL.graviton =  0
	
	#get_tree().paused = true



func _on_tubo_abajo_body_entered(body):
	$golpe.play()
	var flash = flash_scene.instantiate()
	add_child(flash)
	
	var pepe = get_tree().get_nodes_in_group("hud")
	for i in pepe:
		i.show()
	
	GLOBAL.graviton =  0
	#get_tree().paused = true


func _on_area_2d_body_entered(body):
	$coin.play()
	var juego_seleccion = get_tree().get_nodes_in_group("juego")
	for i in juego_seleccion:
		i.call("subir_puntos")
