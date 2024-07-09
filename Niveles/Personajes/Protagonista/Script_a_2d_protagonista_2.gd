class_name Protagonista
extends CharacterBody2D

# Velocidad de movimiento del personaje
@export var speed: float = 200.0
@onready var animated_sprite_2d = $AnimatedSprite2D

const BALA = preload("res://Niveles/Objetos/Buenos/cb_2d_bala.tscn")
var salud=3
var daño_recibido=false
func _process(delta):
	if Input.is_action_just_pressed("l_click"):
		var bala=BALA.instantiate()
		get_parent().add_child(bala)		
		bala.global_position=self.global_position
		bala.angulo =get_angle_to(get_global_mouse_position())
		
	if salud==0:
		get_tree().reload_current_scene()
		
func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1		
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1		
	if Input.is_action_pressed("ui_down"):
		direction.y += 1		
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1		
		
	if direction.x != 0:
		$AnimatedSprite2D.animation = "Ir_Lado"
		$AnimatedSprite2D.play("Ir_Lado")
		$AnimatedSprite2D.flip_h = direction.x < 0
		
	elif direction.y != 0:
		if direction.y < 0:
			$AnimatedSprite2D.animation = "Ir_Arriba"			
		else:
			$AnimatedSprite2D.animation = "Ir_Abajo"			
		$AnimatedSprite2D.play($AnimatedSprite2D.animation)
	else:
		$AnimatedSprite2D.animation = "Ir_Abajo"
		$AnimatedSprite2D.play("Ir_Abajo")		
	
	#Para q se detenga la animacion:
	if direction.length_squared() == 0:
		$AnimatedSprite2D.stop()	
	

	# Normalizar el vector de dirección para que no se mueva más rápido en diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Aplicar movimiento al personaje
	velocity = direction * speed
	move_and_slide()

signal dañorecibidoporPerro1(salud)
signal dañorecibidoporAlien1(salud)
signal dañorecibidoporRobot(salud)
func _on_area_2d_body_entered(body):
	if body != self:
		if body is Perros:
			if not daño_recibido:
				salud -=1	
				print("Al PROTAGONISTA le queda ", salud, "puntos de vida")
				daño_recibido=true
				$Timer.start()
				emit_signal("dañorecibidoporPerro1", salud)
		if body is Alien1:
			if not daño_recibido:
				salud -=1	
				print("Al PROTAGONISTA le queda ", salud, "puntos de vida")
				daño_recibido=true
				$Timer.start()
				emit_signal("dañorecibidoporAlien1", salud)
		if body is Robot:
			if not daño_recibido:
				salud -=1	
				print("Al PROTAGONISTA le queda ", salud, "puntos de vida")
				daño_recibido=true
				$Timer.start()
				emit_signal("dañorecibidoporRobot", salud)


func _on_timer_timeout():
	daño_recibido=false
