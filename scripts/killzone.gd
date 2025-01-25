extends Area2D
var checkpoint_manager
var player
@onready var timer: Timer = $Timer

func _ready() -> void:
	checkpoint_manager = get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("player")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		killPlayer()

func _on_timer_timeout() -> void:
	#get_tree().reload_current_scene()
	pass
	
func killPlayer():
	player.position = checkpoint_manager.last_location
