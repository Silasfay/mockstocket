class_name Player extends CharacterBody2D

var speed := 500 #Pixels per second

var hoveredStock = null
var Portf 

var pitch

var portfolio = [
	0,0,0,0
]
var currency = 2000

func setHoverignStock(stock:Stock) -> void:
	if stock is Stock:
		print(stock.stock_id)
	elif stock == null:
		print(-1)
		
	hoveredStock = stock


func _ready() -> void:
	Portf = get_node("/root/Main/Portfolio")



func _process(delta: float) -> void:
	var movementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = movementDirection * speed
	move_and_slide()
	#position = (position+movement).clamp()
	if Input.is_action_just_pressed("buy"):
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
	if Input.is_action_just_pressed("sell"):
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
