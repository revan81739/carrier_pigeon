extends Area2D

@export var speed = 450.0

func _process(delta):
	position.x -= speed * delta


func _on_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage()
		
		queue_free()	
