extends Area3D

class_name Food

@export var food_name: String

var _spin_speed: float = 180
var _mesh: Node3D


func _ready() -> void:
	GameEvents.food_mouse_entered.connect(_on_mouse_entered)
	GameEvents.food_mouse_exited.connect(_on_mouse_exited)

	set_up_mesh_reference()


# For this function to work, the MeshInstance3D object for the fruit
# must be the last item in the Food scene (after all other children)
func set_up_mesh_reference() -> void:
	var mesh_child_index = self.get_children().size() - 1
	_mesh = get_child(mesh_child_index)



func _process(delta: float) -> void:
	if $SpotLight3D.visible:
		_mesh.rotation_degrees.y += _spin_speed * delta


func _on_mouse_entered(food: Food) -> void:
	if self == food:
		$SpotLight3D.visible = true


func _on_mouse_exited() -> void:
	$SpotLight3D.visible = false
