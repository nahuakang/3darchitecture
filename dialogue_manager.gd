extends Control

# In Godot 4.0, nodes can be directly exported as properties in a script
# without having to use NodePaths
@export var _dialog_text: Label
@export var _avatar: TextureRect
@export var _current_dialogue: Dialogue

var _current_slide_index: int = 0

func _ready() -> void:
	_avatar.texture = _current_dialogue.avatar_texture
	show_slide()

	GameEvents.dialog_initiated.connect(_on_dialog_initiated)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("advance_slide"):
		if _current_slide_index < _current_dialogue.dialogue_slides.size() - 1:
			_current_slide_index += 1
			show_slide()
		else:
			self.visible = false


func show_slide() -> void:
	_dialog_text.text = _current_dialogue.dialogue_slides[_current_slide_index]


func _on_dialog_initiated() -> void:
	print("Dialog initiated")
