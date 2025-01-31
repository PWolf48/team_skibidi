extends Node2D

@onready var cutscene = $Cutscene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene.play("creditscene")


func _on_cutscene_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
