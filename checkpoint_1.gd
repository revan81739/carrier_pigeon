extends Area2D


var activ = false

func _on_body_entered(body):
	if activ:
		return
		
	if body.is_in_group("player"):
		activ = true
		body.respawn_position = global_position +Vector2(60,0)
		print("checkpoint activated")
		
	
		body.process_mode=Node.PROCESS_MODE_DISABLED
		$Sprite2D.modulate=Color.AQUAMARINE
		
		DialogueManager.show_dialogue_balloon(preload("res://check.dialogue"),"check")
		DialogueManager.dialogue_ended.connect(func(_resource):
			body.process_mode = Node.PROCESS_MODE_INHERIT
			, CONNECT_ONE_SHOT)
		
