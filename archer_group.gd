extends Node2D


@export var arrow_scene : PackedScene

func _ready():
	$Timer.timeout.connect(fire_volley)
	
func fire_volley():
	
	for marker in get_children():
		
		if marker is Marker2D:
			var arrow = arrow_scene.instantiate()
			get_tree().current_scene.add_child(arrow)
			arrow.global_position = marker.global_position
			
			arrow.launch(
				Vector2(-700, -250)
			)
		
