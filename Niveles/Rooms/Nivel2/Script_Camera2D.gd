extends Camera2D

@export var ObjetoSeguir:NodePath
var Objetivo=Area2D

func _ready():
	Objetivo=get_node(ObjetoSeguir)
func _physics_process(delta):
	if Objetivo:
		global_position=Objetivo.global_position



