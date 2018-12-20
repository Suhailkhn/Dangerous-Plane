extends Node2D

var scene_to_load

func _ready():
	$NinePatchRect.rect_position.x = 380
	$NinePatchRect.rect_position.y = 20
	$NinePatchRect/VBoxContainer/NewGame.grab_focus()
	$NinePatchRect/HighScore.set_text(str(Settings.get_setting("score", "high_score")))
	$MainMenuMusic.play(GLOBAL.main_menu_playback_position)

func _on_Tutorial_pressed():
	#get_tree().change_scene("res://Tutorial.tscn")
	scene_to_load = "res://Scenes/Tutorial.tscn"
	$ButtonSelect.play()
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_NewGame_pressed():
	#get_tree().change_scene("res://Root.tscn")
	scene_to_load = "res://Scenes/Main.tscn"
	$ButtonSelect.play()
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_to_load)



func _on_MainMenuMusic_tree_exiting():
	GLOBAL.main_menu_playback_position = $MainMenuMusic.get_playback_position()


func _on_Quit_pressed():
	$ButtonSelect.play()
	get_tree().quit()