class_name Player extends CharacterBody2D

@export var speed := 500 #Pixels per second
@export var device : int


var hoveredStock = null
var Portf 

var pitch

var portfolio = [
	0,0,0,0
]
var currency = 2000




func _ready() -> void:
	Portf = get_node("/root/Main/Portfolio")



func _process(delta: float) -> void:
	
		var movementDirection = MultiplayerInput.get_vector(device,"left", "right", "up", "down")
		velocity = movementDirection * speed
		move_and_slide()
		#position = (position+movement).clamp()
		if MultiplayerInput.is_action_just_pressed(device,"buy"):
			pitch = randf_range(.99,1.1)
			$AudioStreamPlayer.set_pitch_scale(pitch)
			$AudioStreamPlayer.play(0)
			if hoveredStock != null and currency > hoveredStock.get_price():
				#print(str(currency))
				#print(str(hoveredStock.get_price()))
				#Portfolio[] #TODO fix portfolio to enable buying
				currency -= snapped(hoveredStock.get_price(),.01)
				#print(str(currency))
				portfolio[hoveredStock.stock_id] += 1
				Portf.update_port_buy(hoveredStock.stock_id,portfolio[hoveredStock.stock_id], currency)
				#print(str(portfolio[hoveredStock.stock_id]))
			else:
				print("not hovering!")
		if MultiplayerInput.is_action_just_pressed(device,"sell"):
			pitch = randf_range(.8,.98)
			$AudioStreamPlayer.set_pitch_scale(pitch)
			$AudioStreamPlayer.play(0)
			if hoveredStock != null:
				#print(str(currency))
				#print(str(hoveredStock.get_price()))
				#Portfolio[] #TODO fix portfolio to enable selling
				currency += snapped(hoveredStock.get_price(), .01)
				#print(str(currency))
				portfolio[hoveredStock.stock_id] -= 1
				Portf.update_port_buy(hoveredStock.stock_id,portfolio[hoveredStock.stock_id], currency)
				#print(str(portfolio[hoveredStock.stock_id]))
			else:
				print("not hovering!")
