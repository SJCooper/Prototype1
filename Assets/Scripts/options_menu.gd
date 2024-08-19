extends Control

func _on_display_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/display_menu.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/start_menu.tscn")

func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/audio_menu.tscn")
