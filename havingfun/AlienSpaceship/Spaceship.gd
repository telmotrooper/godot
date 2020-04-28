extends RigidBody2D

var thrust = Vector2(0, 100)
var torque = 20000

func _integrate_forces(state):
    if Input.is_action_pressed("ui_down"):
        set_applied_force(thrust.rotated(rotation))
    else:
        set_applied_force(Vector2())
    var rotation_dir = 0
    if Input.is_action_pressed("ui_right"):
        rotation_dir += 1
    if Input.is_action_pressed("ui_left"):
        rotation_dir -= 1
    set_applied_torque(rotation_dir * torque)
