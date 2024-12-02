class_name Player extends CharacterBody2D

@export var speed : float = 1000
@export var device : int
@export var playerNumNode : Label

var hoveredStock : StockScreen
var portfolioNode : Portfolio
var playerColor : Color
var playerNumber : int

var pitch
var holdBuyTimer : float
var holdSellTimer : float

func _ready():
	if playerColor : self.modulate = playerColor
	if playerNumber : playerNumNode.text = str(playerNumber)

func _process(delta):
	## Movement
	var movementDirection = MultiplayerInput.get_vector(device,"left", "right", "up", "down")
	velocity = movementDirection.normalized() * speed
	move_and_slide()
	
	## Checks to see if button is held. If so, repeat buy or sell 5 times a second. Does not allow both to be done at once.
	if holdBuyTimer > 0 and MultiplayerInput.is_action_pressed(device,"buy"):
		holdBuyTimer += delta
		if holdBuyTimer > 1:
			holdBuyTimer = 0.8
			if hoveredStock:
				if portfolioNode.buyStock(hoveredStock.value, hoveredStock.nameLabel.text):
					playSFX(randf_range(0.99,1.1))
				
	if holdSellTimer > 0 and MultiplayerInput.is_action_pressed(device,"sell"):
		holdSellTimer += delta
		if holdSellTimer > 1:
			holdSellTimer = 0.8
			if hoveredStock:
				if portfolioNode.sellStock(hoveredStock.value, hoveredStock.nameLabel.text):
					playSFX(randf_range(0.8,0.98))
	
	## Resets hold timer if no input detected.
	if !MultiplayerInput.is_action_pressed(device,"sell") and !MultiplayerInput.is_action_pressed(device,"buy"):
		holdBuyTimer = 0
		holdSellTimer = 0
	
	## Buy or sell inputs. Does not allow both to be done at once.
	if MultiplayerInput.is_action_just_pressed(device,"buy") and !MultiplayerInput.is_action_pressed(device,"sell"):
		holdBuyTimer += delta
		if hoveredStock:
			if portfolioNode.buyStock(hoveredStock.value, hoveredStock.nameLabel.text):
				playSFX(randf_range(0.99,1.1))
		
	if MultiplayerInput.is_action_just_pressed(device,"sell") and !MultiplayerInput.is_action_pressed(device,"buy"):
		holdSellTimer += delta
		if hoveredStock:
			if portfolioNode.sellStock(hoveredStock.value, hoveredStock.nameLabel.text):
				playSFX(randf_range(0.8,0.98))

func playSFX(pitch : float):
	$AudioStreamPlayer.set_pitch_scale(pitch)
	$AudioStreamPlayer.play(0)
