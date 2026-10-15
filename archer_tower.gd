extends Node2D

const ArrowScene = preload("res://arrow.tscn")

@onready var marker = $Marker2D
@onready var timer = $Timer

func _ready():
	timer.timeout.connect(shoot)
	
func shoot():
	
	var arrow = ArrowScene.instantiate()
	
	get_tree().current_scene.add_child(arrow)
	
	arrow.global_position = marker.global_position
	
	
