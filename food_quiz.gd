extends Node3D

@export var adventurer_npc: Node3D
@export var adventurer_npc_texture: Texture


func _ready() -> void:
	for child in adventurer_npc.get_children():
		# https://docs.godotengine.org/en/stable/classes/class_meshinstance3d.html
		child = child as MeshInstance3D
		var material = child.get_surface_override_material(0)
		# https://docs.godotengine.org/en/stable/classes/class_basematerial3d.html#class-basematerial3d
		material.albedo_texture = adventurer_npc_texture
