extends Position2D

onready var enemy = load("res://characters/test_enemy/test_enemy.tscn")
var enemy_count = 50

onready var level = $"../PlayerHandler/Player/Camera2D".get_viewport_rect()
export (float) var minWaitTime
export (float) var maxWaitTime
export (NodePath) var Handler 
onready var EnemiesHandler = get_node(Handler)
 
func _ready():
	randomize()
	$"Timer".set_wait_time(rand_range(minWaitTime,maxWaitTime))
	$"Timer".start()

func _on_Timer_timeout():
	var Player = $"../PlayerHandler".get_child(0) 

	if enemy_count > 0:
		var new_enemy = enemy.instance()
		var cells = $"../TileMap".get_used_cells()
		var sort = rand_range(0,cells.size())
		var new_position =  cells[sort] * 16
		
		EnemiesHandler.get_parent().add_child(new_enemy)
		new_enemy.set_position(Vector2(new_position.x + 8,new_position.y - new_enemy.get_node("CollisionShape2D").shape.get_extents().y))
		enemy_count -= 1

	$"Timer".set_wait_time(rand_range(minWaitTime,maxWaitTime))
	$"Timer".start()
	pass 