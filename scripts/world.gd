extends Node2D
@export var tuberia_escena: PackedScene

func _ready() -> void:
	Global.connect("on_game_start", game_start)

func game_start():
	$Timer_tuberia.start()

func crear_tuberias():
	var tuberia = tuberia_escena.instantiate()
	add_child(tuberia)


func _on_timer_tuberia_timeout() -> void:
	crear_tuberias()


func _on_colision_piso_body_entered(body: Node2D) -> void:
	if body is Player: 
		$choque_piso.play()
		Global.game_over()
		$Timer_tuberia.stop()
		
