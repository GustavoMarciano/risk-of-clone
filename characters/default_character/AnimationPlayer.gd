extends AnimationPlayer

var animation_player = null
var anime = ""
var anime_new = ""
var scale = 0

func set_animation(n_anime):
	anime = n_anime
	pass
	
func get_animation():
	return anime
	pass
	
func set_character_xscale(look,greater_than_less_than):
	if look > greater_than_less_than:
		scale = 1
	elif look < greater_than_less_than:
		scale = -1
	$"../Sprite".set_scale(Vector2(scale,1))
	pass

func set_character_yscale(look,greater_than_less_than):
	if look > greater_than_less_than:
		scale = 1
	elif look < greater_than_less_than:
		scale = -1
	$"../Sprite".set_scale(Vector2(1,scale))
	pass
	
func set_weapon_yscale(look,greater_than_less_than):
	if look > greater_than_less_than:
		scale = 1
	elif look < greater_than_less_than:
		scale = -1
	$"..".set_scale(Vector2(1,scale))
	pass

func _process(delta):
	
	if (anime != anime_new):
		anime_new = anime
		$"../Sprite".play(anime)