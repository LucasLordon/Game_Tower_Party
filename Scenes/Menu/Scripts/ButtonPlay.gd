extends Button

@export var test_level_scene: PackedScene

# variables for the movements of the buttons:
# the isGoing... are bool that are true when you click on their respective buttons 
# and allow to do the movement
# the updatesButton X or Y are floats that count the distance made by the buttons, it
# will allow them to come back when touched in a button, and go to the right place
var isGoingDown : bool = false
var isGoingUp : bool = false
var isGoingRight : bool = false
var isGoingRightBack : bool = false
var isGoingLeft : bool = false
var isGoingLeftBack : bool = false
var updatesButtonY : float = 0
var updatesButtonX : float = 0

func _process(delta):
	if isGoingDown:
		position.y += 600 * delta
		updatesButtonY += 600 * delta
		if updatesButtonY > 560:
			isGoingDown = false
	
	if isGoingUp:
		position.y -= 600 * delta
		updatesButtonY-= 600 * delta
		if updatesButtonY < 0:
			isGoingUp = false
	
	if isGoingLeftBack:
		position.x -= 600 * delta
		updatesButtonX -= 600 * delta
		if updatesButtonX < 0: 
			isGoingLeftBack = false
	
	if isGoingRight:
		position.x += 600 * delta
		updatesButtonX += 600 * delta
		if updatesButtonX > 1080:
			isGoingRight = false
	
	if isGoingRightBack:
		position.x

func _on_pressed():
	isGoingDown = true

func _on_button_back_pressed():
	isGoingUp = true

func _on_button_1p_pressed():
	isGoingRight = true

func _on_button_back_1p_pressed():
	isGoingLeftBack = true

func _on_button_classic_pressed():
	get_tree().change_scene_to_packed(test_level_scene)
