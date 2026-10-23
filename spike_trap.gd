extends Node2D


var activated = false

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.stop()
	$Hitbox.monitoring = false
	
func _on_trigger_body_entered(body):
	if activated:
		return
		
	if body.is_in_group("player"):
		activated=true
		sprite.play("default")


func _on_animated_sprite_2d_animation_finished() -> void:
	$Hitbox.monitoring = true
