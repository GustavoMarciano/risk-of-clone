extends Position2D

export (float) var minWaitTime
export (float) var maxWaitTime
export (NodePath) var Handler 

onready var enemy = load("res://characters/test_enemy/test_enemy.tscn")
onready var Player = $"../PlayerHandler".get_child(0) 
onready var EnemiesHandler = get_node(Handler)
onready var Spawns = $"../TileMap".get_children()
onready var VisibleSpawns = []

var enemy_count = 0

func _ready():
	randomize()
	$"Timer".set_wait_time(rand_range(minWaitTime,maxWaitTime))
	$"Timer".start()

func _on_Timer_timeout():
	var sort = rand_range(0,VisibleSpawns.size())
	var new_enemy = enemy.instance()
	EnemiesHandler.get_parent().add_child(new_enemy)
	var new_position = VisibleSpawns[sort]
	var wd = new_position.get_rect().size.x * new_position.get_scale().x
	var enemy_shape = new_enemy.get_node("CollisionShape2D").shape.get_extents().y

	new_enemy.set_position(Vector2(new_position.global_position.x + rand_range(0,wd),new_position.global_position.y - enemy_shape))
	print(Performance.get_monitor(0),"/",enemy_count)
	enemy_count += 1
	$"Timer".set_wait_time(rand_range(minWaitTime,maxWaitTime))
	$"Timer".start()
	pass 