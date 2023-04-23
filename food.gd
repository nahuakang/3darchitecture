extends Area3D

class_name Food

@export var food_name: String

func _ready() -> void:
	GameEvents.food_mouse_entered.connect(_on_mouse_entered)
	GameEvents.food_mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered(food: Food) -> void:
	if self == food:
		$SpotLight3D.visible = true


func _on_mouse_exited() -> void:
	$SpotLight3D.visible = false
