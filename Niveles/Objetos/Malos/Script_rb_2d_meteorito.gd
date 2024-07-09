class_name Meteorito
extends RigidBody2D
var velocidad_min =150
var velocidad_max =250
var tipo_roca =["Grande", "Chiquito"]

func _ready():
	$AnimatedSprite2D.animation = tipo_roca[randi() % tipo_roca.size()]
	
	if $AnimatedSprite2D.animation =="grande":
		$CollisionShape2D.scale.x=2
		$CollisionShape2D.scale.y=2
