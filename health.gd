extends CanvasLayer

func _ready():
	add_to_group("hud")
	
func update_health(value):
	$hearts/heart0.visible = value >= 1
	$hearts/heart1.visible = value >=2
	
