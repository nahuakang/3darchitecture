extends Area3D

class_name Food

func _ready() -> void:
	GameEvents.food_mouse_entered.connect(_on_mouse_entered)
	GameEvents.food_mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered(food: Area3D) -> void:
	if self == food:
		$SpotLight3D.visible = true


func _on_mouse_exited() -> void:
	$SpotLight3D.visible = false
