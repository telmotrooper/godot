extends Area2D

export (int) var speed
var screensize

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()# the player's movement vector

	if Input.is_action_pressed("ui_right"):
	  velocity.x += 1
	if Input.is_action_pressed("ui_left"):
	  velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
	  velocity.y += 1
	if Input.is_action_pressed("ui_up"):
	  velocity.y -= 1

	if velocity.length() > 0:
	  velocity = velocity.normalized() * speed
	  $AnimatedSprite.play()
	else:
	  $AnimatedSprite.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

	if velocity.x != 0:
	  $AnimatedSprite.animation = "right"
	  $AnimatedSprite.flip_v = false
	  $AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0 && Input.is_action_pressed("ui_down"):
	  $AnimatedSprite.animation = "front"
	elif velocity.y != 0 && Input.is_action_pressed("ui_up"):
	  $AnimatedSprite.animation = "back"
