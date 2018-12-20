extends KinematicBody2D

var collision
var motion = Vector2()

# Different for each blade
var max_draw_div
var min_draw_div
const radius = 58.0
const padding = 45.0
var health = 10


func _ready():
	add_to_group(ROOT.GROUP_BLADES)
	$Blade.play("rotate")
	if(ROOT.place_on_top == true):
		min_draw_div = radius + padding
		max_draw_div = 600 * 0.6 - radius - padding
	else:
		min_draw_div = 600 * 0.4
		max_draw_div = 600 - radius - padding
	randomize()
	position.y = rand_range(min_draw_div, max_draw_div)
	position.x = 1200 + radius
	ROOT.place_on_top = !ROOT.place_on_top
	ROOT.blade_speed += 0.1


func _physics_process(delta):
		motion.x = -ROOT.blade_speed
		collision = move_and_collide(motion)
		if(position.x < -radius or health == 0):
			if(health == 0):
				ROOT.current_score += 10
			if(!$".".is_queued_for_deletion()):
				$".".queue_free()
