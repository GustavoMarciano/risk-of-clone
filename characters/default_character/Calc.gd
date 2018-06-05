extends Node

######### CALC FUNCTION ######
func calc(type,value,variable,MAX,MIN):
	match type:
		"=":
			if !(value >= MAX):
				variable = value
				return variable
			else:
				variable = MAX
				return variable
		"+":
			if !(variable+value >= MAX):
				variable = variable + value
				return variable
			else:
				variable = MAX
				return variable
		"-":
			if !(variable-value <= MIN):
				variable = variable - value
				return variable
			else:
				variable = MIN
				return variable
		"/":
			if !(variable/value <= MIN):
				variable = variable / value
				return variable
			else:
				variable = MIN
				return variable
		"*":
			if !(variable/value >= MIN):
				variable = variable * value
				return variable
			else:
				variable = MIN
				return variable
		"+%":
			if !(variable + value/100 * MAX >= MAX):
				variable = variable + value/100 * MAX
				return variable
			else:
				variable = MAX
				return variable
		"-%":
			if !(variable + value/100 * MAX <= MIN):
				variable = variable - value/100 * MAX
				return variable
			else:
				variable = MIN
				return variable