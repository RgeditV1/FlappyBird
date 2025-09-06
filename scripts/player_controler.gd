extends Node2D
class_name Player

@onready var player: Player = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")


var velocidad_salto: float = 400

func _ready() -> void:
	animated_sprite_2d.play("Fly")

func salto(delta: float) -> void:
	if(Input.is_action_just_pressed("Jump") and not player.is_on_floor()):
		$AudioStreamPlayer2D.play()
		player.velocity.y = - velocidad_salto
	else:
		player.velocity.y += gravedad * delta
	player.move_and_slide()

func _physics_process(delta: float) -> void:
	if Global.is_start == true:
		salto(delta)
