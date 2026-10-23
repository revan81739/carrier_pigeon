extends Node2D


var activ = false

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.stop()
	$Hitbox.monitoring=false
		





func _on_trigger_body_entered(body: Node2D) -> void:
	if activ:
		return
		
	if body.is_in_group("player"):
		activ = true
		$Hitbox.monitoring=true
		sprite.play("swing")


func _on_animated_sprite_2d_animation_finished() -> void:
	$Hitbox.monitoring=false
	


func _on_hitbox_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
