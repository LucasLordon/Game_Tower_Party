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

func _on_ready():
	pass


func _process(delta):
	if isGoingDown:
		position.y += 600 * delta
		updatesButtonY += 600 * delta
		allButtonsDisabled()
		if updatesButtonY > 560:
			isGoingDown = false
			allButtonsEnabled()
	
	if isGoingUp:
		position.y -= 600 * delta
		updatesButtonY-= 600 * delta
		allButtonsDisabled()
		if updatesButtonY < 0:
			isGoingUp = false
			allButtonsEnabled()
	
	if isGoingLeftBack:
		position.x -= 600 * delta
		updatesButtonX -= 600 * delta
		allButtonsDisabled()
		if updatesButtonX < 0: 
			isGoingLeftBack = false
			allButtonsEnabled()
	
	if isGoingLeft:
		position.x -= 600 * delta
		updatesButtonX -= 600 * delta
		allButtonsDisabled()
		if updatesButtonX < -1080:
			isGoingLeft = false
			allButtonsEnabled()
	
	if isGoingRight:
		position.x += 600 * delta
		updatesButtonX += 600 * delta
		allButtonsDisabled()
		if updatesButtonX > 1080:
			isGoingRight = false
			allButtonsEnabled()
	
	if isGoingRightBack:
		position.x += 600 * delta
		updatesButtonX += 600 * delta
		allButtonsDisabled()
		if updatesButtonX > 0 :
			isGoingRightBack = false
			allButtonsEnabled()

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

func _on_button_back_mp_pressed():
	isGoingRightBack = true

func _on_button_multiplayer_pressed():
	isGoingLeft = true

func allButtonsDisabled():
	$".".disabled = true
	$ButtonHelp.disabled = true
	$ButtonQuit.disabled = true
	$ButtonBack.disabled = true
	$ButtonBack/Button1P.disabled = true
	$ButtonBack/Button1P/ButtonBack1P.disabled = true
	$ButtonBack/Button1P/ButtonBack1P/ButtonClassic.disabled = true
	$ButtonBack/Button1P/ButtonBack1P/ButtonVariants.disabled = true
	$ButtonBack/ButtonMultiplayer.disabled = true
	$ButtonBack/ButtonMultiplayer/ButtonBackMP.disabled = true
	$ButtonBack/ButtonMultiplayer/ButtonBackMP/Control/ButtonJoinLobby.disabled = true
	$ButtonBack/ButtonMultiplayer/ButtonBackMP/Control/ButtonCreateLobby.disabled = true

func allButtonsEnabled():
	$".".disabled = false
	$ButtonHelp.disabled = false
	$ButtonQuit.disabled = false
	$ButtonBack.disabled = false
	$ButtonBack/Button1P.disabled = false
	$ButtonBack/Button1P/ButtonBack1P.disabled = false
	$ButtonBack/Button1P/ButtonBack1P/ButtonClassic.disabled = false
	$ButtonBack/Button1P/ButtonBack1P/ButtonVariants.disabled = false
	$ButtonBack/ButtonMultiplayer.disabled = false
	$ButtonBack/ButtonMultiplayer/ButtonBackMP.disabled = false
	$ButtonBack/ButtonMultiplayer/ButtonBackMP/Control/ButtonJoinLobby.disabled = false
	$ButtonBack/ButtonMultiplayer/ButtonBackMP/Control/ButtonCreateLobby.disabled = false
