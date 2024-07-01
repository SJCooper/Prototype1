extends CharacterBody2D


var SPEED = 200.0
const JUMP_VELOCITY = -350.0
var speedAdjust = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED / speedAdjust
	else:
		velocity.x = move_toward(velocity.x, 0, (SPEED / speedAdjust))
		
	#walk right animation logic
	if Input.is_action_pressed("ui_right") && Input.is_key_pressed(KEY_SHIFT):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
		speedAdjust = 2
	#walk left animation logic
	elif Input.is_action_pressed("ui_left") && Input.is_key_pressed(KEY_SHIFT):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
		speedAdjust = 2
	#crouch walk right logic
	elif Input.is_action_pressed("ui_right") && Input.is_key_pressed(KEY_Z):
		$AnimatedSprite2D.play("crouch_walk")
		$AnimatedSprite2D.flip_h = false
		speedAdjust = 4
	#crouch walk left logic
	elif Input.is_action_pressed("ui_left") && Input.is_key_pressed(KEY_Z):
		$AnimatedSprite2D.play("crouch_walk")
		$AnimatedSprite2D.flip_h = true
		speedAdjust = 4
	##slide right logic
	#elif Input.is_action_pressed("ui_right") && Input.is_key_pressed(KEY_X):
		#$AnimatedSprite2D.play("slide")
		#$AnimatedSprite2D.flip_h = false
		#speedAdjust = 1
		#SPEED = SPEED - 2
		#if SPEED < 0:
			#SPEED = 0
	##slide left logic
	#elif Input.is_action_pressed("ui_left") && Input.is_key_pressed(KEY_X):
		#$AnimatedSprite2D.play("slide")
		#$AnimatedSprite2D.flip_h = true
		#speedAdjust = 1
		#SPEED = SPEED - 2
		#if SPEED < 0:
			#SPEED = 0
	#run right animation logic
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false
		speedAdjust = 1
	#run left animation logic
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = true
		speedAdjust = 1
	#crouch idle
	elif Input.is_key_pressed(KEY_Z):
		$AnimatedSprite2D.play("crouch_idle")
	#idle animation logic
	else:
		$AnimatedSprite2D.play("idle")
		
	move_and_slide()
