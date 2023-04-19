@tool
extends EditorScenePostImport

func _post_import(scene: Node) -> Object:
	scene = scene as Node3D
	if not scene:
		return scene

	var mesh = scene.get_child(0) as MeshInstance3D
	if not mesh:
		return scene

	mesh.create_trimesh_collision()
	return scene
