extends Node
class_name Portfolio

@export var playerName : Label
@export var funds : Label
@export var ownedStock : RichTextLabel

var playerNode : Player

func _ready():
	if playerNode:
		self.modulate = playerNode.playerColor
		playerName.text = "Player %1d" % playerNode.playerNumber

func _process(delta):
	pass
