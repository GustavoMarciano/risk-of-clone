extends "res://characters/default_character/Movement.gd"

func _ready():
	#initializing object variables and state
	$"Status".set_state("IDLE")
	$"Status".set_speed("=",50)
	$"Status".set_total_hp("=",500)
	$"Status".set_hp("=",500)
	$"AnimationPlayer".set_character_xscale(1,0)
	pass

func control():
	#assining variables with the mapkeys
	var ui_right = int(Input.is_action_pressed("ui_right"))
	var ui_left = -int(Input.is_action_pressed("ui_left"))
	var ui_jump = Input.is_action_pressed("ui_jump")

	#jump logic
	if ui_jump && is_on_floor():
		motion.y -= 200 #change the number varible

	direction = ui_right + ui_left #direction will be iquals the sum of int(ui right) and int(ui left), being a int if activate it will return 1, -1 or both at same time returning a 0 
	motion.x = direction * $"Status".get_speed()#finali passing the multiplication of that number plus the velocity for motion.x. EX: (motion.x = 1 * 100),(motion.x = 0 * 100) remember 0 * X is always 0 
	pass

func _physics_process(delta):
	#initializing player state machine, it's really important to know that consept , state machine will be the core part of the player 
	match $"Status".get_state(): #match the state from Statatus
		"IDLE":
			control() #calling the player control
			$"AnimationPlayer".set_character_xscale(direction,0)#making player looks toward the direction(-1 or 1)

			if motion.x == 0 && motion.y == 0: #placeholder
				$"AnimationPlayer".set_animation("idle")  #placeholder
			else: 
				$"AnimationPlayer".set_animation("idle")#placeholder

		"DEATH": 
			print("hello")#placeholder
	pass 