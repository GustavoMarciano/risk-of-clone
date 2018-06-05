extends "res://characters/default_character/Movement.gd"

func _ready():
	$"Status".set_state("IDLE")
	$"Status".set_speed("=",50)
	$"Status".set_total_hp("=",500)
	$"Status".set_hp("=",500)
	$"AnimationPlayer".set_character_xscale(1,0)
	pass

func control():
	var ui_right = int(Input.is_action_pressed("ui_right"))
	var ui_left = -int(Input.is_action_pressed("ui_left"))
	var ui_jump = Input.is_action_pressed("ui_jump")
	
	if ui_jump && is_on_floor():
		motion.y -= 200

	direction = ui_right + ui_left
	motion.x = direction * $"Status".get_speed()
	pass

func _physics_process(delta):

	match $"Status".get_state():
		"IDLE":
			control()
			$"AnimationPlayer".set_character_xscale(direction,0)
			if motion.x == 0 && motion.y == 0:
				$"AnimationPlayer".set_animation("idle")
			else:
				$"AnimationPlayer".set_animation("idle")

		"DEATH":
			print("hello")
	pass 