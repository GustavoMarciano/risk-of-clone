extends Node

############################### SIGNALS ################################################
signal die

###############################DEFAULT STATUS############################################
const MAXSPEED = 800
const MINSPEED = 100
const MINHP = 1
const MAXHP = 999
var target = null setget set_target,get_target
var state = "" setget set_state,get_state
var hp  setget set_hp,get_hp
var total_hp setget set_total_hp,get_total_hp
var speed  setget set_speed,get_speed
enum Sides {PLAYER,HORDE,OTHER}
export (Sides) var side = Sides setget set_side,get_side

##### POWERS ###### 
var invisibility = false
var invincibility = false
var taunt = false 

################################# SETTERS AND GETTERS ######################################

##### TARGET ######
func set_target(new_target):
	target = new_target

func get_target():
	return target

##### SIDES ######
func set_side(new_side):
	side = new_side

func get_side():
	return side

######## STATE #####
func set_state(new_state):
	state = new_state

func get_state():
	return state

####### SPEED #######
func set_speed(type,value):
	speed = $"Calc".calc(type,value,speed,MAXSPEED,MINSPEED)

func get_speed():
	return speed

####### HP ###########
func set_hp(type,value):
	hp = $"Calc".calc(type,value,hp,total_hp,MINHP)
	if hp <= MINHP:
		set_state("DEATH")

func get_hp():
	return hp

####### TOTAL_HP #######
func set_total_hp(type,value):
	total_hp = $"Calc".calc(type,value,hp,MAXHP,MINHP)

func get_total_hp():
	return total_hp