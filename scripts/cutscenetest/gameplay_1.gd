extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_take_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scenestestanim/takeBottle.tscn")


func _on_meet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scenestestanim/meetPeople.tscn")
