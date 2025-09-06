extends Node
signal on_increment_score
signal on_game_start
signal on_game_over

var is_start := false
var score: int

func start_game():
	is_start = true
	score = 0 #para llamar al metodo change score en gui y volverlo a 0
	emit_signal("on_increment_score")
	emit_signal("on_game_start")

func game_over():
	get_tree().paused = true
	is_start = false
	emit_signal("on_game_over")

func incrementar_score():
	score += 1
	emit_signal("on_increment_score")
