extends KinematicBody2D

export (int) var speed = 400
#var velocity = Vector2()

onready var target = null

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		velocity = move_and_slide(velocity)

	if target:
		var clickVelocity = position.direction_to(target) * speed;
		if position.distance_to(target) > 5:
			move_and_slide(clickVelocity)
		else:
			target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
