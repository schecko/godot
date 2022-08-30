extends KinematicBody

export var min_speed = 10
export var max_speed = 18

var velocity = Vector3.ZERO

func init(start_pos, player_pos):
	look_at_from_position(start_pos, player_pos, Vector3.UP)
	rotate_y(rand_range(_PI/4, PI/4))
	var random_speed = rande_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)


func _physics_process(delta):
	move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier_screen_exited():
	queue_free()
