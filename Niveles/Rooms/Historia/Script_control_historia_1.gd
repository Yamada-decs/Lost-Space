extends Control
@onready var historia_1 = $Historia1
@onready var historia_2 = $Historia2
@onready var historia_3 = $Historia3
@onready var timer_mostrar_2 = $Timer_Mostrar2
@onready var timer_mostrar_3 = $Timer_Mostrar3
@onready var timer_mostrar_pp = $Timer_Mostrar_PP

signal Mostrar_Pantalla_Principal
# Declara una variable para el otro control que deseas mostrar
var otro_control

# Called when the node enters the scene tree for the first time.
func _ready():
	historia_1.show()
	historia_2.hide()
	historia_3.hide()
	timer_mostrar_2.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_mostrar_2_timeout():
	historia_1.hide()
	historia_2.show()
	historia_3.hide()
	timer_mostrar_3.start()

func _on_timer_mostrar_3_timeout():
	historia_1.hide()
	historia_2.hide()
	historia_3.show()
	timer_mostrar_pp.start()

#func invisibles(): #es llamado en el nivel 1
	#historia_1.hide()
	#historia_2.hide()
	#historia_3.hide()

func _on_timer_mostrar_pp_timeout():	
	#get_tree().change_scene_to_file("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn")
	
	#var new_scene=null
	#new_scene=preload("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn").instantiate()
	#
	#new_scene.set("Dato", "Hola causa")
	#
	#get_tree().get_root().add_child(new_scene)
	
	
	#var new_scene = preload("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn").instantiate()

	# Aquí seteas el dato antes de agregar la escena como hijo
	#new_scene.set_dato("Hola causa")
	
	#SceneTransition.load_scene("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn")
	#get_tree().get_root().add_child()
	
	get_tree().change_scene_to_file("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn")
	
