extends CharacterBody3D


@export var _mouse_sensitivity: float = 0.1
@export var _move_speed: float = 5.0
@export var _jump_velocity: float = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity_y = 0

# Movement vectors
var movement_vector: Vector3
var forward_movement: Vector3
var sideways_movement: Vector3


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta) -> void:
	move(delta)


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


func move(delta) -> void:
#	if (Input.is_action_pressed("move_forward")):
#		forward_movement = -transform.basis.z
#	elif (Input.is_action_pressed("move_backward")):
#		forward_movement = transform.basis.z
#
#	if (Input.is_action_pressed("move_left")):
#		sideways_movement = -transform.basis.x
#	elif (Input.is_action_pressed("move_right")):
#		sideways_movement = transform.basis.x
#
#	movement_vector = (forward_movement + sideways_movement).normalized()
#	velocity = movement_vector * _move_speed

	var horizontal_velocity = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")

	velocity = (horizontal_velocity.x * global_transform.basis.x + horizontal_velocity.y * global_transform.basis.z) * _move_speed

	if is_on_floor():
		velocity_y = 0

		if Input.is_action_just_pressed("jump"):
			velocity_y = _jump_velocity
	else:
		velocity_y -= gravity * delta

	velocity.y = velocity_y

	move_and_slide()
