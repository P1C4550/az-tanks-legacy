extends Sprite2D

var velocity = Vector2(3, 2)

func _ready():
	set_process(true)

func _process(delta):
	var screen_size = get_viewport_rect().size
	var actual_size = texture.get_size() * scale

	if position.x - (actual_size.x / 2) <= 0 or position.x + (actual_size.x / 2) >= screen_size.x:
		velocity.x = -velocity.x

	if position.y - (actual_size.y / 2) <= 0 or position.y + (actual_size.y / 2) >= screen_size.y:
		velocity.y = -velocity.y

	position += velocity
