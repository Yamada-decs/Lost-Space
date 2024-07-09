extends Node2D
const RB_2D_METEORITO = preload("res://Niveles/Objetos/Malos/rb_2d_meteorito.tscn")


var dato_recibido = ""

func set_dato(dato):
	
	dato_recibido = dato
	print("Dato recibido:", dato_recibido)
	# Aquí puedes hacer lo que necesites con el dato recibido



func _init():#No puede estar con ready sino F
	print("Holaaaaaaaaa")

#func _ready():
	#randomize()#Aleatorio sea diferente en cada juego
	

#func _on_control_historia_1_mostrar_pantalla_principal():
	#$Control_Historia_1.invisibles()
	#$CL_Inicio_Juego.get_node("Button").show()
	#$CL_Inicio_Juego.get_node("Mensaje").show()

func _on_cl_inicio_juego_iniciar_juego():#Es la señal que viene desde el CL	
	$CL_Inicio_Juego.mostrar_mensaje("Listo")
	$inicio_tiempo.start()#Para que recien corra el tiempo de la roca
	print("AL PRESIONAR: ", dato_recibido)
	
func _on_inicio_tiempo_timeout():
	$tiempo_roca.start()
	

func _on_tiempo_roca_timeout():
	var rng = RandomNumberGenerator.new()
	
	# Inicialmente, la posición del asteroide en el eje x es un valor aleatorio
	# entre 100 y el ancho de la pantalla menos 100.
	var asteroide_Position = Vector2(rng.randf_range(100, DisplayServer.screen_get_size().x - 100), 0)
	var velocidadAngular = 3.0
	var direccion = Vector2(-10, 100)  # Por defecto, la dirección es hacia abajo
	
	# Generamos un número aleatorio entre -1.0 y 1.0
	# Si es menor o igual a 0, el asteroide saldrá desde abajo
	if rng.randf_range(-1.0, 1.0) <= 0:
		asteroide_Position.y = 680  # Cambiamos la posición y a 500 (parte inferior de la pantalla)
		direccion.y = -100  # Cambiamos la dirección para que vaya hacia arriba
	
	# Instanciamos el asteroide y lo agregamos como hijo del nodo actual
	var R = RB_2D_METEORITO.instantiate()
	add_child(R)
	R.position = asteroide_Position
	R.set_linear_velocity(direccion)  # Establecemos la velocidad lineal
	R.angular_velocity = velocidadAngular  # Establecemos la velocidad angular
	
	# Verificamos si la posición x del asteroide es mayor a 500
	# Si es así, lo liberamos
	if R.position.x > 2100:
		R.queue_free()
	
	# Configuramos el tiempo de espera para el próximo asteroide
	$tiempo_roca.set_wait_time(rng.randf_range(0.5, 1.4))

func _on_area_2d_body_entered(body):
	if body != self:
		if body is Prota1:
			
			print("Al PROTAGONISTA LLegó a la meta")
			get_tree().change_scene_to_file("res://UI/Video2.tscn")
			
