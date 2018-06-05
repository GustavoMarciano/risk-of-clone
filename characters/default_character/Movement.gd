extends KinematicBody2D

############# set the constants of every character #################
const UP = Vector2(0,-1)
var motion = Vector2()
var direction = Vector2()

############# move character #################
func _physics_process(delta):
	motion.y+=10
	motion = move_and_slide(motion,UP)