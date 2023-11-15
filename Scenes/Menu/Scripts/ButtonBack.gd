extends Button

var isGoingUp:bool = false

func _process(delta):
	if $Button1P.isGoingRight:
		position.y -= 600 * delta
		if position.y < 250:
			$Button1P.isGoingRight = false

func _on_pressed():
	isGoingUp = true
