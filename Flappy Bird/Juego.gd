extends Node2D


func subir_puntos():
	GLOBAL.score += 1 
	GLOBAL.best += 1 
	if GLOBAL.best > GLOBAL.score:
		GLOBAL.best -= 1




func _process(delta):
	
	if GLOBAL.graviton_active() == 0:
		$Timer.start(2)
	
	$ParallaxBackground/ParallaxLayer.motion_offset.x -= 0.1
	$ParallaxBackground2/ParallaxLayer.motion_offset.x -= 0.9
	
	var grupo_tubo = get_tree().get_nodes_in_group("GrupoTubo")
	for i in grupo_tubo:
		if i.position.x < -50:
			ARRAYTUBO.tubo_array.pop_front()
			i.queue_free()



func _ready():
	
	$Hud.hide()


@export var tubos: PackedScene
func _on_timer_timeout():
	var tubos_instanciados = tubos.instantiate()
	$SpawnTubos.add_child(tubos_instanciados)
	tubos_instanciados.position = Vector2(160,randi_range(35, 180))
	ARRAYTUBO.tubo_array.push_back(tubos_instanciados)


func _on_area_2d_body_entered(body):
	dead()
	pass



func dead():
	$Hud.show()
	get_tree().paused = true

func live():
	$Jugador.velocity.y = 0
	ARRAYTUBO.tubo_array.clear()
	var tubos_instancia = get_tree().get_nodes_in_group("GrupoTubo")
	for i in tubos_instancia:
		i.queue_free()
	$Hud.hide()

