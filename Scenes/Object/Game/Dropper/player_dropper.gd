extends Node2D



var speed = 500
var vel = Vector2()

func _ready():
	set_process(true)




var CanSpawnRandomPieces: bool = true
var pieces_paths = ["res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumBlue.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumDarkBlue.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumGreen.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumOrange.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumPurple.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumRed.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumYellow.tscn"]
signal piece_detected(pieceNumber)

func _process(delta):
	
	var direction = Vector2()
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	var vel = direction.normalized() * speed
	self.translate(vel * delta)

	
	
	
	
	
	
	
	if CanSpawnRandomPieces:
		spawn_random_piece()
		$SpawnPiecesTimer.start()
		CanSpawnRandomPieces = false
func _on_timer_timeout():
	CanSpawnRandomPieces = true
func spawn_random_piece():
	var pieceNumber = randi() % pieces_paths.size()
	piece_detected.emit(pieceNumber)
