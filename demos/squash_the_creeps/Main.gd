extends Node

export (PackedScene) var mob_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Performance.get_monitor(Performance.TIME_FPS))

func _on_MobTimer_timeout():
	var mob = mob_scene.instance()

	var spawn_location = $"SpawnPath/SpawnLocation"
	spawn_location.unit_offset = randf()
	var player_position = $Player.transform.origin
	mob.init(spawn_location.translation, player_position)
	add_child(mob)
