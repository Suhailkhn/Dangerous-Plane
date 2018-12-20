extends KinematicBody2D

signal shoot
var motion = Vector2(0,0)
const GRAVITY = 12
const UP_ACCELERATION = -420
var friction = false
var collision
var count

func _ready():
	ROOT.plane = $"."
#	position.x = get_viewport_rect().size.x/3
	position.x = 380
	position.y = 600/3
	$PlaneSprite.animation = "fly"
	$PlaneSprite.play()


func _physics_process(delta):
	if (Input.is_action_just_pressed("ui_right") and ROOT.no_of_bullets > 0):
		$PlaneSprite.play("shoot")
		emit_signal("shoot")
	else:
		$PlaneSprite.play("fly")
	motion.y += GRAVITY
#	if Input.is_action_pressed("ui_select"):
##		$"../SoundAndMusic/Jump".play()
#		motion.y = UP_ACCELERATION
#		friction = true
	if Input.is_action_just_pressed("ui_select"):
		motion.y = UP_ACCELERATION
		friction = true
		$"../SoundAndMusic/Jump".play()
	if(friction == true):
		if(motion.y < 0):
			motion.y += 1.5
		else:
			friction = false
	move_and_slide(motion)
	#position.y = clamp(position.y, 0, 600)
	count = get_slide_count()
	if(count > 0):
		collision = get_slide_collision(0)
	if(collision):
		$"../BladeSpawnTimer".stop()
		ROOT.blade_speed = 0
		$PlaneSprite.play("explosion")
		$"../SoundAndMusic/Explosion".play()
		set_physics_process(false)
		collision = -1
	if(position.y > 600 + 30):
		$"../BladeSpawnTimer".stop()
		ROOT.blade_speed = 0
		$PlaneSprite.play("dead")
		$"../SoundAndMusic/Fall".play()
		position.y = 600 - 100
		set_physics_process(false)