extends CharacterBody3D


@export var _mouse_sensitivity: float = 0.1
@export var _move_speed: float = 5.0


# Movement vectors
var movement_vector: Vector3
var forward_movement: Vector3
var sideways_movement: Vector3


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta) -> void:
	move()


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


func move() -> void:
	if (Input.is_action_pressed("move_forward")):
		forward_movement = -transform.basis.z
	elif (Input.is_action_pressed("move_backward")):
		forward_movement = transform.basis.z

	if (Input.is_action_pressed("move_left")):
		sideways_movement = -transform.basis.x
	elif (Input.is_action_pressed("move_right")):
		sideways_movement = transform.basis.x

	movement_vector = (forward_movement + sideways_movement).normalized()
	velocity = movement_vector * _move_speed

	move_and_slide()
