extends Node2D
var activ = false

	
	


func _on_trigger_body_entered(body: Node2D) -> void:
	if activ:
		return
	if body.is_in_group("player"):
		activ = true 
		
		DialogueManager.dialogue_ended.connect(_on_dialogue_ended, CONNECT_ONE_SHOT)
		
		
		DialogueManager.show_dialogue_balloon(
			preload("res://end.dialogue"),
			"fart"
			)
		
		
		
func _on_dialogue_ended(resource):
	if resource and resource.resource_path == "res://end.dialogue":
		get_tree().quit()
				
