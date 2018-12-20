extends Node2D

var plane

onready var bullet = preload("res://Scenes/Bullet.tscn")
var new_bullet
var no_of_bullets = 3 setget _set_current_no_of_bullets
var bullet_spawn_timer_count = 0
signal no_of_bullets_changed

onready var blades = preload("res://Scenes/BladeFactory.tscn").instance()
var new_blade
var place_on_top = true
var blade_speed = 1.9
const GROUP_BLADES = "blades"

var game_over = preload("res://Scenes/GameOver.tscn")
var game_over_screen

signal current_score_changed
signal high_score_changed
var current_score = 0 setget _set_current_score
var high_score = 0 setget _set_high_score

var set_audio = false

func _ready():
	ROOT.blade_speed = 1.9
	ROOT.current_score = 0
	ROOT.no_of_bullets = 3
	#$BladeSpawnTimer.start()


func _set_current_score(new_value):
	current_score = new_value
	emit_signal("current_score_changed")

func _set_high_score(new_value):
	high_score = new_value
	Settings.set_setting("score", "high_score", high_score)
	emit_signal("high_score_changed")


func _set_current_no_of_bullets(new_value):
	no_of_bullets = new_value
	emit_signal("no_of_bullets_changed")


func _on_BladeSpawnTimer_timeout():
	new_blade = blades.generate_blade()
	add_child(new_blade)
	$BladeSpawnTimer.set_wait_time((360.0/(ROOT.blade_speed))/60.0)
	#print($BladeSpawnTimer.get_wait_time())
	$BladeSpawnTimer.start()


func _on_BulletSpawnTimer_timeout():
	bullet_spawn_timer_count += 1
	if(ROOT.no_of_bullets < 3):
		ROOT.no_of_bullets += 1
		if(bullet_spawn_timer_count == 4):
			$BulletSpawnTimer.set_wait_time(9)
		if(bullet_spawn_timer_count == 6):
			$BulletSpawnTimer.set_wait_time(8)
		if(bullet_spawn_timer_count == 7):
			$BulletSpawnTimer.set_wait_time(7)
		if(bullet_spawn_timer_count == 9):
			$BulletSpawnTimer.set_wait_time(6)
		if(bullet_spawn_timer_count == 11):
			$BulletSpawnTimer.set_wait_time(5)



func _on_Plane_shoot():
	new_bullet = bullet.instance()
	ROOT.no_of_bullets -= 1
	#$Shoot.play()
	$SoundAndMusic/Shoot.play()
	add_child(new_bullet)


func _on_PlaneSprite_animation_finished():
	var anim = $Plane/PlaneSprite.get_animation()
	if(anim == "explosion" or anim == "dead"):
		if(ROOT.current_score > Settings.get_setting("score", "high_score")):
			Settings.set_setting("score", "high_score", ROOT.current_score)
		$SoundAndMusic/GameMusic.stop()
		$CurrentScore.visible = false
		$Bullets.visible = false
		game_over_screen = game_over.instance()
		add_child(game_over_screen)


func _on_Instruction_timeout():
	$Instructions.visible = false
