extends Node2D

const ArrowScene = preload("res://arrow.tscn")
@export var shoot_direction = Vector2.LEFT
@onready var marker = $Marker2D
@onready var timer = $Timer

func _ready():
	timer.timeout.connect(shoot)
	
func shoot():
	
	var arrow = ArrowScene.instantiate()
	
	arrow.direction = shoot_direction.normalized()
	
	
	get_tree().current_scene.add_child(arrow)
	
	arrow.global_position = marker.global_position
	
	
