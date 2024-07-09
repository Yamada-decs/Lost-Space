class_name Bala
extends CharacterBody2D

var movimiento = Vector2.ZERO
var velocidad = 300
var angulo = 0
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	angulo = get_angle_to(get_global_mouse_position())
	movimiento.x = cos(angulo)
	movimiento.y = sin(angulo)
	
func _physics_process(delta):
	movimiento = Vector2(cos(angulo), sin(angulo)).normalized() * velocidad
	velocity = movimiento
	
	move_and_slide()

func _on_timer_timeout(): #Se eliminará luego de n segundos wasa
	queue_free()

func _on_area_2d_body_entered(body):
	print("Area 2d de la Bala chocó con: ",body)
	queue_free()
