extends Node2D

var scene_to_load

func _ready():
	$NinePatchRect/Score.set_text(str(ROOT.current_score))
	$NinePatchRect/HighScore.set_text(str(Settings.get_setting("score", "high_score")))
	$NinePatchRect.rect_position.x = 600 - 205
	$NinePatchRect.rect_position.y = 600
	$GameOverMusic.play()
	$NinePatchRect/HBoxContainer/Restart.grab_focus()
	#print(get_viewport_rect().size.x)

func _process(delta):
	if($NinePatchRect.rect_position.y >= 89):
		$NinePatchRect.rect_position.y -= 8
	else:
		set_process(false)


func _on_Restart_pressed():
	$ButtonSelect.play()
	scene_to_load = "res://Scenes/Main.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()


#func _on_Home_pressed():
#	scene_to_load = "res://Scenes/MainMenu.tscn"
#	$FadeIn.show()
#	$FadeIn.fade_in()
#	GLOBAL.main_menu_playback_position = 0.0


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_to_load)


func _on_Home_pressed():
	$ButtonSelect.play()
	scene_to_load = "res://Scenes/MainMenu.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	GLOBAL.main_menu_playback_position = 0.0
