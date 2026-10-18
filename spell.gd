extends Area2D

@export var speed = 250.0
var direction = Vector2.ZERO

func _physics_process(delta):
	position += direction * speed * delta
	
func _on_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage()
		
		queue_free()
