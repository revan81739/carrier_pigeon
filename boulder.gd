extends Area2D

var velocity := Vector2.ZERO

const GRAVITY = 900.0

func launch(v):
	velocity = v
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	
	if body.name == "Player":
		body.take_damage()
		
		queue_free()
	
