extends CanvasLayer
const TILE_HEART_MORADO = preload("res://Assets_Lost_Space/UI/tile_heart_morado.png")
const TILE_HEART = preload("res://Assets_Lost_Space/UI/tile_heart.png")


	


func _on_a_2d_protagonista_dañorecibidoporasteroide(salud):
	print("El daño llegó al canvas layer, le queda", salud)
	$HBoxContainer/TextureRect.texture = TILE_HEART_MORADO if salud>=1 else TILE_HEART
	$HBoxContainer/TextureRect2.texture = TILE_HEART_MORADO if salud>=2 else TILE_HEART
	$HBoxContainer/TextureRect3.texture = TILE_HEART_MORADO if salud>=3 else TILE_HEART




func _on_cb_2d_protagonista_2_dañorecibidopor_perro_1(salud):
	print("El daño DE ENEMIGOS llegó al canvas layer, le queda", salud)
	$HBoxContainer/TextureRect.texture = TILE_HEART_MORADO if salud>=1 else TILE_HEART
	$HBoxContainer/TextureRect2.texture = TILE_HEART_MORADO if salud>=2 else TILE_HEART
	$HBoxContainer/TextureRect3.texture = TILE_HEART_MORADO if salud>=3 else TILE_HEART


func _on_cb_2d_protagonista_2_dañorecibidopor_alien_1(salud):
	print("El daño DE ENEMIGOS llegó al canvas layer, le queda", salud)
	$HBoxContainer/TextureRect.texture = TILE_HEART_MORADO if salud>=1 else TILE_HEART
	$HBoxContainer/TextureRect2.texture = TILE_HEART_MORADO if salud>=2 else TILE_HEART
	$HBoxContainer/TextureRect3.texture = TILE_HEART_MORADO if salud>=3 else TILE_HEART


func _on_cb_2d_protagonista_3_dañorecibidopor_robot(salud):
	print("El daño DE ENEMIGOS llegó al canvas layer, le queda", salud)
	$HBoxContainer/TextureRect.texture = TILE_HEART_MORADO if salud>=1 else TILE_HEART
	$HBoxContainer/TextureRect2.texture = TILE_HEART_MORADO if salud>=2 else TILE_HEART
	$HBoxContainer/TextureRect3.texture = TILE_HEART_MORADO if salud>=3 else TILE_HEART
