extends VideoStreamPlayer

func _on_VideoPlayer_finished():
	get_tree().change_scene_to_file("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn")
