extends Control
class_name MaskControl

export (Array, Material) var materials: Array ;

func _process(_time: float):
	var local_xform: Transform2D = Transform2D(Vector2(rect_size.x,0.0), Vector2(0.0,rect_size.y),Vector2(0.5,0.5))
	var mask_to_world_xform: Transform2D = (get_viewport_transform() * get_global_transform() * local_xform)
	for material in materials:
		material.set_shader_param("mask_transform", mask_to_world_xform.affine_inverse())
