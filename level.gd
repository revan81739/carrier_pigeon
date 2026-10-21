extends Node2D


func _ready():
	print("level ready")
	await get_tree().create_timer(0.75).timeout
	print("calling dialogue")
	$dialogue.show_story()
