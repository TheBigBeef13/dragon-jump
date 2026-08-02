extends Node3D
@onready var spring_arm_3d: SpringArm3D = $SpringArm3D

@export var player: CharacterBody3D

var yaw: float = 0.0
var pitch: float = 0.0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * 0.003
		pitch -= event.relative.y * 0.003
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func _process(_delta: float) -> void:
	pitch = clamp(pitch, deg_to_rad(-40.0), deg_to_rad(70.0))
	rotation.y = yaw
	spring_arm_3d.rotation.x = pitch
func _physics_process(delta: float) -> void:
	if not player:
		return
	global_position = global_position.lerp(player.global_position, 12.0 * delta)
	
