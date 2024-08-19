extends Control

func _on_display_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/display_menu.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/start_menu.tscn")

func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/audio_menu.tscn")
