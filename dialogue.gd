extends CanvasLayer


func _ready():
	visible = false
	
func show_story():
	print("story shown")
	visible = true
	get_tree().paused = true

func hide_story():
	visible = false
	get_tree().paused = false
	
	
func _unhandled_input(event):
	
	if visible \
	and event.is_action_pressed("ui_accept"):
		hide_story()
