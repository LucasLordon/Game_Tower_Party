extends Button

var isGoingDown : bool = false
var isGoingUp : bool = false
var isGoingRight : bool = false
var isGoingLeft : bool = false

func _process(delta):
	if isGoingDown:
		position.y += 400 * delta
		if position.y > 800:
			isGoingDown = false
			pass
	
	if isGoingUp:
		position.y -= 400 * delta
		if position.y < 250:
			isGoingUp = false
	
	if isGoingLeft:
		position.x -= 600 * delta
		if position.y < 500: #A changer la value
			isGoingLeft = false
		
	if isGoingRight:
		position.x += 600 * delta
		if position.x > 1575:
			isGoingRight = false

# When the button is pressed, other buttons will display
func _on_pressed():
	isGoingDown = true

func _on_button_back_pressed():
	isGoingUp = true

func _on_button_1p_pressed():
	isGoingRight = true

func _on_button_back_1p_pressed():
	isGoingLeft = true
