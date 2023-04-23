extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.food_mouse_entered.connect(_on_food_hovered)
	GameEvents.food_mouse_exited.connect(_on_food_unhovered)


func _on_food_hovered(food: Food) -> void:
	self.text = food.food_name
	self.visible = true


func _on_food_unhovered() -> void:
	self.visible = false
