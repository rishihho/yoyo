extends KinematicBody2D

const speed = 100
const gravity = 10
const jumppower = -250
const ground = Vector2(0, -1)

var velocity = Vector2()
var onground = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if is_on_floor() == true:
			$AnimatedSprite.play("right")
			velocity.x = speed
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
	
	elif Input.is_action_pressed("ui_left"):
		if is_on_floor() == true:
			$AnimatedSprite.play("left")
			velocity.x = -speed
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
	
	else:
		velocity.x = 0
		if onground == true:
			$AnimatedSprite.play("idle")
		
	if Input.is_action_pressed("ui_up") and onground == true:
		velocity.y = jumppower
		onground = false
		
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, ground)
	
	if is_on_floor():
		onground = true
	else:
		onground = false
