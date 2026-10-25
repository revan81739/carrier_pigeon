extends Node2D


const spellScene = preload("res://spell.tscn")
var activated = false
@onready var marker = $Marker2D
@onready var timer = $Timer

func _ready():
	timer.timeout.connect(shoot)
	
func shoot():
	var player = get_tree().get_first_node_in_group("player")
	
	if player == null:
		return
	
	var spell = spellScene.instantiate()
	
	get_tree().current_scene.add_child(spell)
	
	spell.global_position = marker.global_position
	
	spell.direction = (
		player.global_position - marker.global_position
	).normalized()
		
		


func _on_trigger_body_entered(body: Node2D) -> void:
	if activated:
		return
		
	if body.is_in_group("player"):
		activated = true
		
		$Timer.start()
	
