extends Control


func _on_mute_toggled(toggled_on):
	AudioServer.is_bus_mute(0)





func _on_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/options_menu.tscn")



