extends Node2D

@onready var cutscenePrologue = $Cutscene

func _ready() -> void:
	cutscenePrologue.play("cutscenePrologue")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
