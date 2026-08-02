extends CharacterBody3D

@export var camera_rig: Node3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 10.0
const MAX_JUMPS = 2

var jump_count = 2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump and double jump
	if is_on_floor():
		jump_count = MAX_JUMPS
	if Input.is_action_just_pressed("jump") and jump_count > 0:
		velocity.y = JUMP_VELOCITY
		jump_count -= 1
	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (camera_rig.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		var target_angle := atan2(-direction.x, -direction.z)
		rotation.y = lerp_angle(rotation.y, target_angle, TURN_SPEED * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
