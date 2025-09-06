extends Node2D

var velocidad: float= 250


func _ready() -> void:
	position.x = 392.0 #aparecera un poco fuera de la pantalla
	position.y = randf_range(352.0, 576) #aparecera de forma random entre esas posiciones

func _process(delta: float) -> void:
	position.x -= velocidad * delta

#si se detecta que salio de la pantalla....
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_abajo_body_entered(body: Node2D) -> void:
	if body is Player:
		$choque_tubo.play()
		Global.game_over()

func _on_score_body_entered(body: Node2D) -> void:
	if body is Player:
		$moneda.play()
		Global.incrementar_score()
