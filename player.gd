extends CharacterBody2D

const GRAVITY = 900.0
const FLAP_FORCE = -350.0
const MAX_FALL_SPEED = 500.0

func _physics_process(delta):
	
	# Apply gravity
	velocity.y += GRAVITY * delta
	
	#prevent falling infinitely fast
	velocity.y = min(velocity.y, MAX_FALL_SPEED)
	
	#flap
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = FLAP_FORCE
		
	move_and_slide()
	
	#rotation
	rotation = lerp(rotation, deg_to_rad(velocity.y / 10), 5 * delta)
	
