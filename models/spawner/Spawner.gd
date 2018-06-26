extends Position2D

export (float) var min_waitTime
export (float) var max_waitTime
export (NodePath) var handler 

onready var enemy = load("res://characters/test_enemy/TestEnemy.tscn")
onready var player = $"../PlayerHandler".get_child(0)
onready var enemies_handler = get_node(handler)
onready var init_spawns = $"../TileMap".get_children()
var visible_spawns = []
var enemy_count = 0

func _ready():
	randomize()
	$"Timer".set_wait_time(rand_range(min_waitTime,max_waitTime))
	$"Timer".start()

func _on_Timer_timeout():
	if enemy_count<40:
		var sort = rand_range(0,visible_spawns.size())
		var new_enemy = enemy.instance()
		var n_position = visible_spawns[sort]
		var enemy_shape = new_enemy.get_node("CollisionShape2D").shape.get_extents().y

		enemies_handler.get_parent().add_child(new_enemy)
		new_enemy.set_position(Vector2(n_position.global_position.x + rand_range(0,n_position.get_rect().size.x * n_position.get_scale().x),n_position.global_position.y - enemy_shape+1))
	enemy_count += 1
	$"Timer".set_wait_time(rand_range(min_waitTime,max_waitTime))
	$"Timer".start()
	pass 