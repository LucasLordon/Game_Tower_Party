extends Control

@export var Address = "127.0.0.1"
@export var ServerPort = "9810"

var peer

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)

func peer_connected(id):
	print("Player Connected " + str(id))

# This get called on the server and the clients
func peer_disconnected(id):
	print("Player disconnected " + str(id))

# Called only from clients
func connected_to_server():
	print("Connected to server")

# Called only from clients
func connection_failed():
	print("Connection failed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_join_lobby_pressed():
	peer = ENetMultiplayerPeer.new()
	peer.create_client(Address, int(ServerPort))
	peer.get_host()
	multiplayer.set_multiplayer_peer(peer)


func _on_button_create_lobby_pressed():
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(int(ServerPort), 4)
	if error != OK:
		print("Cannot host: " + error)
		return
	peer.get_host()
	
	# Sets the host as peer
	multiplayer.set_multiplayer_peer(peer)
	print("Waiting for players...")
