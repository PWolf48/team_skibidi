extends Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/testmain.tscn")


func _on_hint_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/hint_menu.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
