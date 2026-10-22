extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
var respawn_position : Vector2
var health = 3
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
		
	
	var target_rotation = deg_to_rad(velocity.y / 30.0)
	rotation = lerp(sprite.rotation, target_rotation, ROTATION_SPEED * delta)
	
func take_damage(amount):
		health -= amount
		
		get_tree().call_group("hud", "update_health", health)
		
		if health <= 0:
			die()

func die():
	health = 3
	
	global_position = respawn_position
	get_tree().call_group("hud", "update_health", health)
	
	
	
func _ready():
	sprite.play("flying")
	add_to_group("player")
	
	respawn_position = global_position
	
	
