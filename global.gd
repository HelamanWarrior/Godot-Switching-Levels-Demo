extends Node

var camera = null

func _process(delta):
	if Input.is_action_pressed("escape"):
		get_tree().quit()
