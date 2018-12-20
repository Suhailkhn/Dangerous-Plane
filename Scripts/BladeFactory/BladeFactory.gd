extends Node2D

func generate_blade():
	randomize()
	var index = randi() % 10
	return get_child(index).duplicate()