extends Node2D

@onready var enemy = preload("res://scenes/bird.tscn")


func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.posotion = position
	get_parent().get_node("EnemyHandler").add_child(ene)
