extends Area2D

@export var bob_height := 8
@export var bob_speed:=1.5
var start_position :Vector2
var time = 0.0



func _ready() -> void:
	start_position =position
	

	



func _process(delta: float) -> void:
	time +=delta
	position.y = start_position.y +sin(time * TAU * bob_speed)*bob_height


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.activate_rune()
		queue_free()
