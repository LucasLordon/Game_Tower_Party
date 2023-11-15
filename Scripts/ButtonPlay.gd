extends Button

var isButtonGoingDown: bool = false

func _process(delta):
	if isButtonGoingDown:
		position.y += 400 * delta
		if position.y > 800:
			isButtonGoingDown = false
			pass
	
	if $ButtonBack.isGoingUp:
		position.y -= 400 * delta
		if position.y < 250:
			$ButtonBack.isGoingUp = false
	

# When the button is pressed, other buttons will display
func _on_pressed():
	isButtonGoingDown = true
