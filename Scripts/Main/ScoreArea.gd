extends Area2D

var score_increment = 5

func _ready():
	position.x = 380 - 89 - 60 - 70
	connect("body_entered", self, "on_body_entered")

func on_body_entered(other_body):
	if(other_body.is_in_group(ROOT.GROUP_BLADES)):
		ROOT.current_score += score_increment
		#print(ROOT.current_score)


func _on_IncreaseScoreIncrement_timeout():
	score_increment += 5
