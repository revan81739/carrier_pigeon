extends Node2D
var activated = false
const ArrowScene = preload("res://EnemyArrow.tscn")
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
	
	


func _on_trigger_body_entered(body: Node2D) -> void:
	if activated:
		return
		
	if body.is_in_group("player"):
		activated=true
		$Timer.start()
		
