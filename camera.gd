extends Camera2D

@export var noise_texture: FastNoiseLite

var time = 0

func _ready():
	Global.camera = self

func _process(delta):
	time += delta
	
	offset.x = noise_texture.get_noise_1d(time * 20) * 15
	offset.y = noise_texture.get_noise_1d(-time * 20 + 50) * 15
	
	zoom.x = 1 - abs(noise_texture.get_noise_1d(time * 10 + 100) * 0.2)
	zoom.y = zoom.x

func _exit_tree():
	Global.camera = null
