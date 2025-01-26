extends Area2D

var checkpoint_manager
var player
@onready var timer: Timer = $Timer

func _ready() -> void:
	checkpoint_manager = get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("player")

func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		timer.start()
		player.visible = false
	elif body.is_in_group("bubble"):
		body.queue_free()
		get_tree().reload_current_scene()
		print("Game over")

func _on_timer_timeout() -> void:
	killPlayer()

func killPlayer():
	player.visible = true
	player.position = checkpoint_manager.last_location
