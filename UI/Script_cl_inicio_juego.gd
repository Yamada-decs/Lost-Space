extends CanvasLayer
signal iniciar_juego #es para mandar una seña

#func _ready():
	#$Button.hide()
	#$Mensaje.hide()

func mostrar_mensaje(texto): #es llamado en el nivel 1
	$Mensaje.text = texto
	$Mensaje.show()
	$Timer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	$Button.show()
	$Mensaje.text = "Space Guy"
	$Mensaje.show()

func _on_button_pressed():	
	$Button.hide()#Volverse invisible P
	emit_signal("iniciar_juego")


func _on_timer_timeout():
	$Mensaje.hide()#Volverse invisible P
