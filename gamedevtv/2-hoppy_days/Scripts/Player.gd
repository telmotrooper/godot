extends KinematicBody2D

const SPEED = 750
const GRAVITY = 2500
const UP = Vector2(0, -1)
const JUMP_SPEED = -1100

var motion = Vector2()
export var world_limit = 3200

func _ready():
  Global.Player = self

func _physics_process(delta):
  fall(delta)
  run()
  jump()
  move_and_slide(motion, UP)

func fall(delta):
  if is_on_floor():
    motion.y = 0
  elif is_on_ceiling():
    motion.y = 1
  else:
    motion.y += GRAVITY * delta

  if position.y > world_limit:
    Global.GameState.end_game()

func hurt():
  motion.y = JUMP_SPEED

func jump():
  if is_on_floor() and Input.is_action_pressed("ui_up"):
    motion.y = JUMP_SPEED

func run():
  if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
    motion.x = SPEED
    $AnimatedSprite.play("run")
    $AnimatedSprite.flip_h = false
    
  elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
    motion.x = -SPEED
    $AnimatedSprite.play("run")
    $AnimatedSprite.flip_h = true
    
  else:
    motion.x = 0
    $AnimatedSprite.play("idle")
    $AnimatedSprite.flip_h = false


