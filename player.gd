extends CharacterBody3D


@export var _mouse_sensitivity: float = 0.1


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	aim(event)


func aim(event: InputEvent) -> void:
	var mouse_motion = event as InputEventMouseMotion

	if mouse_motion:
		# Rotation for left and right
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity

		# Rotation for up and down; clamping to prevent rolling over
		var current_tilt: float = $Camera3D.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivity
		$Camera3D.rotation_degrees.x = clamp(current_tilt, -90, 90)
