extends Node2D
var speed = 5937.5
var vel = Vector2()
var _nextPieceNumber
var _pieceNumber
var CanMoveDropper: bool = true
var CanSpawnRandomPieces: bool = true
var pieces_paths = ["res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumBlue.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumDarkBlue.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumGreen.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumOrange.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumPurple.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumRed.tscn",
"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumYellow.tscn"]
signal piece_detected(pieceNumber,nextPieceNumber)

func _ready():
	set_process(true)
	_nextPieceNumber = randi() % pieces_paths.size()

func _process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("right")and CanMoveDropper:
		direction.x += 1
		CanMoveDropper=false
		$CanMove.start()
	if Input.is_action_pressed("left")and CanMoveDropper:
		direction.x -= 1
		CanMoveDropper=false
		$CanMove.start()
	var vel = direction.normalized() * speed
	self.translate(vel * delta)
	if CanSpawnRandomPieces:
		spawn_random_piece()
		$SpawnPiecesTimer.start()
		CanSpawnRandomPieces = false
func _on_timer_timeout():
	CanSpawnRandomPieces = true
func spawn_random_piece():
	_pieceNumber = _nextPieceNumber
	_nextPieceNumber = randi() % pieces_paths.size()
	piece_detected.emit(_pieceNumber,_nextPieceNumber)

func _on_can_move_timeout():
	CanMoveDropper = true
