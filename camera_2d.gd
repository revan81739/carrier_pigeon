extends Camera2D

var target_zoom=Vector2(0.8,0.8)




func _process(delta: float) -> void:
	zoom = zoom.lerp(target_zoom, 3.0 * delta)
