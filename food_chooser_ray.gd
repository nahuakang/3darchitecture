extends RayCast3D

var _is_mouse_entered: bool = false


func _input(event: InputEvent) -> void:
	var collided_food: Area3D = get_collider()

	if collided_food is Food:
		if not _is_mouse_entered:
			_is_mouse_entered = true
			GameEvents.emit_signal("food_mouse_entered", collided_food)
	elif _is_mouse_entered:
		_is_mouse_entered = false
		GameEvents.emit_signal("food_mouse_exited")
