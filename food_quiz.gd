extends Node3D

@export var _adventurer_npc: Node3D
@export var _adventurer_npc_texture: Texture
@export var _dialogue: Dialogue


func _ready() -> void:
	for child in _adventurer_npc.get_children():
		# https://docs.godotengine.org/en/stable/classes/class_meshinstance3d.html
		child = child as MeshInstance3D
		var material = child.get_surface_override_material(0)
		# https://docs.godotengine.org/en/stable/classes/class_basematerial3d.html#class-basematerial3d
		material.albedo_texture = _adventurer_npc_texture


func _on_dialog_trigger_body_entered(body: Node3D) -> void:
	GameEvents.emit_signal("dialog_initiated")
