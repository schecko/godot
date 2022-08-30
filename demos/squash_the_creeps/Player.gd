extends KinematicBody

export var speed = 14
export var gravity = 75
var velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)

		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		velocity.y -= gravity * delta
		velocity = move_and_slide(velocity, Vector3.UP)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
