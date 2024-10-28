extends ColorRect

var shader_material: ShaderMaterial
var input_random_value = 0.0
var input_counter = 0

func _ready():
	shader_material = material

func _process(delta):
	input_counter += 1
	if input_counter > 5:
		input_counter = 0
		input_random_value += 0.1
		if input_random_value > 100.0:
			input_random_value = 0.0
	
	shader_material.set_shader_parameter("input_rand", input_random_value)
