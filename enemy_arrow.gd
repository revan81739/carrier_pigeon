extends Area2D

@export var speed = 450.0


var direction = Vector2.LEFT

func launch(new_direction: Vector2):
	direction = new_direction.normalized()
		
func _physics_process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage()
		
		queue_free()	
