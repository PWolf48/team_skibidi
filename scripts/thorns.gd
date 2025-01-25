extends Area2D

@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../player"

func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		timer.start()
		player.visible = false
	else:
		body.queue_free()
		timer.start()
		print("Game over")

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
