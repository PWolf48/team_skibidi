extends Area2D

@export var connected_scene: String
var scene_folder = "res://scenes/"
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var full_path = scene_folder + connected_scene + ".tscn"
		var scene_tree = get_tree()
		scene_tree.call_deferred("change_scene_to_file", full_path)
