extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	get_tree().change_scene_to_file("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn")
