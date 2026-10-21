extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
var health = 2
const MOVE_SPEED = 250.0
const ROTATION_SPEED = 6.0

func _physics_process(delta):
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
	velocity = direction * MOVE_SPEED
	
	move_and_slide()
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x < 0 :
		$AnimatedSprite2D.flip_h = false
		
	
	var target_rotation = deg_to_rad(velocity.y / 20.0)
	rotation = lerp(rotation, target_rotation, ROTATION_SPEED * delta)
	
func take_damage():
		health -= 1
		
		get_tree().call_group("hud", "update_health", health)
		
		if health <= 0:
			die()

func die():
	
	get_tree().reload_current_scene()


func _ready():
	sprite.play("flying")
	add_to_group("player")
	
