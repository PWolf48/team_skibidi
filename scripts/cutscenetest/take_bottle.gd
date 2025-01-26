extends Node2D

@onready var cutsceneTakeBottle = $Cutscene
var main_path = "res://scenes/color_map.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutsceneTakeBottle.play("takeBottle")


func _on_cutscene_animation_finished(anim_name: StringName) -> void:
	get_tree().call_deferred("change_scene_to_file", main_path)
