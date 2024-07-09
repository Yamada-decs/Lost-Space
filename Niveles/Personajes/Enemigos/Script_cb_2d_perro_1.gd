class_name Perros
extends CharacterBody2D

var jugador = null
var move = Vector2.ZERO
var vel = 150
var smooth_factor = 0.3

var salud=3
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	if salud==0:
		self.queue_free()

func _physics_process(delta):
	move = Vector2.ZERO
	
	if jugador != null:
		var direction = position.direction_to(jugador.position)
		move = move.lerp(direction.normalized() * vel, smooth_factor)
		play_animation(direction)

	else: 
		move = Vector2.ZERO
		animated_sprite_2d.stop()
		
	velocity = move
	move_and_slide()

func play_animation(direction):
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("De_Lado")
	elif direction.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("De_Lado")
	elif direction.y > 0:
		animated_sprite_2d.flip_h = false  # Ensure it's not flipped vertically
		animated_sprite_2d.play("Abajo_Quieto")
	elif direction.y < 0:
		animated_sprite_2d.flip_h = false  # Ensure it's not flipped vertically
		animated_sprite_2d.play("Arriba")


func _on_area_2d_para_acercarse_body_entered(body):
	if body != self: # Si el cuerpo es diferente a si mismo	
		if body is Protagonista:
			jugador = body
			print("En el Area 2d del Perro Entró un: ", jugador)
		


func _on_area_2d_para_acercarse_body_exited(body):
	jugador = null
	print("En el Area 2d del Perro Salió un: ", jugador)
	


func _on_area_2d_para_recibir_daño_body_entered(body):
	if body != self:
		if body is Bala:
				salud -=1	
				print("Al perro le queda ", salud, "puntos de vida")



