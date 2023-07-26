extends Camera2D

func _process(_delta):
	if is_instance_valid(Global.camera):
		global_position = Global.camera.global_position
		offset = Global.camera.offset
		zoom = Global.camera.zoom
