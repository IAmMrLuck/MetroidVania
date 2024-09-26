extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -450.0
const FALL_VELOCITY = 0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("ui_accept"):
		velocity.y = FALL_VELOCITY # Results in the player being able to float if they spam jump
		# This is not the best variant for this, I want to change this - but will do for now


	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
