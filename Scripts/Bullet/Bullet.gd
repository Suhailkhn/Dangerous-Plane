extends KinematicBody2D

var collision

func _ready():
	position.x = ROOT.plane.position.x + 64
	position.y = ROOT.plane.position.y + 17
	visible = true


func _physics_process(delta):
	#translate(Vector2(700*delta,0))
	collision = move_and_collide(Vector2(12,0))
	if(collision):
		collision.get_collider().health -= 10
		if(!$".".is_queued_for_deletion()):
			$".".queue_free()
	position.x = clamp(position.x, 0, 1200)
	if(position.x >= 1200):
		if(!$".".is_queued_for_deletion()):
			$".".queue_free()
