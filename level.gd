extends Node2D

var dialogue_active: bool = false
const DIALOGUE_RESOURCE = preload("res://intro.dialogue")



func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	$ArcherGroup.process_mode=Node.PROCESS_MODE_DISABLED
	$catapult.process_mode=Node.PROCESS_MODE_DISABLED
	$Player.process_mode=Node.PROCESS_MODE_DISABLED
	
	dialogue_active = true
	
	var balloon = DialogueManager.show_dialogue_balloon(DIALOGUE_RESOURCE, "intro")
	if balloon:
		balloon.tree_exited.connect(_on_dialogue_ended)
												   
	


func _on_dialogue_ended() -> void:
	if not dialogue_active:
		return
	dialogue_active = false
	$Player.process_mode =Node.PROCESS_MODE_INHERIT
	$ArcherGroup.process_mode = Node.PROCESS_MODE_INHERIT
	$catapult.process_mode=Node.PROCESS_MODE_INHERIT
												  
	
	
	
