extends Node2D


@export var boulder_scene : PackedScene
@onready var launch_point = $launchPoint

func _ready():
	$Timer.timeout.connect(_fire)
	
func _fire():
	var boulder = boulder_scene.instantiate()
	
	get_tree().current_scene.add_child(boulder)
	
	boulder.global_position = launch_point.global_position
	
	boulder.launch(
		Vector2(-300, -900)
	)	
		
		
	
	
