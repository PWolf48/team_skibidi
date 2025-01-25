extends Area2D

const speed = 60
var direction = -1

var checkpoint_manager
var player
@onready var timer: Timer = $Timer

func _ready() -> void:
	checkpoint_manager = get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("player")

func _process(delta: float) -> void:
	position.x += direction * speed * delta

func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		timer.start()
	else:
		body.queue_free()
		get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	killPlayer()

func killPlayer():
	player.visible = true
	player.position = checkpoint_manager.last_location
