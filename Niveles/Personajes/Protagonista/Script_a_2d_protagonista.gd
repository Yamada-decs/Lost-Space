#extends Area2D
#var velocidad=150
#var movimiento =Vector2()#Significa cordenadas (0,0) osea (x,y)
##var limite
##signal golpe
## Called when the node enters the scene tree for the first time.
##func _ready():
	##hide()
	##limite=get_viewport_rect().size
	##pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#movimiento=Vector2() 
	#if Input.is_action_pressed("ui_right"):
		#movimiento.x +=1
	#if Input.is_action_pressed("ui_left"):
		#movimiento.x -=1
	#if Input.is_action_pressed("ui_down"):
		#movimiento.y +=1
	#if Input.is_action_pressed("ui_up"):
		#movimiento.y -=1
	#if movimiento.length() > 0:
		#movimiento=movimiento.normalized()*velocidad
	#position +=movimiento*delta
	##position.x=clamp(position.x,0,limite.x)
	##position.y=clamp(position.y,0,limite.y)
	#
	#if movimiento.x !=0:
		#$AnimatedSprite2D .animation="De Lado"
		#$AnimatedSprite2D .play("De Lado")
		#$AnimatedSprite2D .flip_h = movimiento.x < 0
		#$AnimatedSprite2D .flip_v = false
		#
	#elif movimiento.y !=0:
		#$AnimatedSprite2D .animation="Atras"
		#$AnimatedSprite2D .flip_v = movimiento.y > 0
	#else:
		#$AnimatedSprite2D .animation="De Frente"
		#
		#
	#pass
#
#
##func inicio(pos):
	##position=pos
	##show()
	##$CollisionShape2D.disabled = false

class_name Prota1
extends CharacterBody2D

# Velocidad de movimiento del personaje
@export var speed: float = 200.0
#@onready var animated_sprite_2d = $AnimatedSprite2D

var salud=3
var daño_recibido=false


func _process(delta):
	if salud==0:
		get_tree().reload_current_scene()
		
		
		#var current_scene = get_tree().current_scene
		#current_scene.queue_free()
		#get_tree().change_scene_to_file("res://Niveles/Rooms/Nivel1/node_2d_nivel_1.tscn")
		
	
	
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1		
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1		
	if Input.is_action_pressed("ui_down"):
		direction.y += 1		
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1		
		
#	if direction.x != 0:
#		$AnimatedSprite2D.animation = "De Lado"
#		$AnimatedSprite2D.play("De Lado")
#		$AnimatedSprite2D.flip_h = direction.x < 0
		
#		$AnimatedSprite2D .flip_v = false
		
#	elif direction.y != 0:
#		if direction.y < 0:
#			$AnimatedSprite2D.animation = "De Frente"
					
#		else:
#			$AnimatedSprite2D.animation = "Atras"			
#			$AnimatedSprite2D .flip_v = direction.y > 0
			
#		$AnimatedSprite2D.play($AnimatedSprite2D.animation)
		
#	else:
#		$AnimatedSprite2D.animation = "De Frente"
#		$AnimatedSprite2D.play("De Frente")		
#		$AnimatedSprite2D .flip_v = direction.y > 0
	
	#Para q se detenga la animacion:
#	if direction.length_squared() == 0:
#		$AnimatedSprite2D.stop()	
	

	# Normalizar el vector de dirección para que no se mueva más rápido en diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Aplicar movimiento al personaje
	velocity = direction * speed
	move_and_slide()

signal dañorecibidoporasteroide(salud)
func _on_area_2d_body_entered(body):
	if body != self:
		if body is Meteorito:
			#if not daño_recibido:
			salud -=1	
			print("Al PROTAGONISTA le queda ", salud, "puntos de vida")
				#daño_recibido=true
				
				
			emit_signal("dañorecibidoporasteroide", salud)
				
