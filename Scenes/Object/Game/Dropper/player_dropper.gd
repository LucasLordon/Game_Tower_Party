extends Node2D

var CanSpawnRandomPieces: bool = true
var pieces = ["res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumBlue.tscn"
,"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumDarkBlue.tscn"
,"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumGreen.tscn"
,"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumOrange.tscn"
,"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumPurple.tscn"
,"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumRed.tscn"
,"res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumYellow.tscn"]

signal piece_detected(chosePiece)

func _process(_delta):
	if(CanSpawnRandomPieces):
		print("piece")
		spawn_random_piece()
		$SpawnPiecesTimer.start()
		CanSpawnRandomPieces = false


func _on_timer_timeout():
	CanSpawnRandomPieces = true


func spawn_random_piece():
	var random_index = randi() % pieces.size()
	var chosePiece = pieces[random_index]
	piece_detected.emit(chosePiece)

