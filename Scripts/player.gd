class_name Player extends CharacterBody2D

var speed := 500 #Pixels per second

var hoveredStock = null

var portfolio = [
	0,0,0,0
]
var currency = 10000000

func setHoverignStock(stock:Stock) -> void:
	if stock is Stock:
		print(stock.stock_id)
	elif stock == null:
		print(-1)
		
	hoveredStock = stock

func _process(delta: float) -> void:
	var movementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = movementDirection * speed
	move_and_slide()
	#position = (position+movement).clamp()
	if Input.is_action_just_pressed("buy"):
		if hoveredStock != null:
			#Portfolio[] #TODO fix portfolio to enable buying
			print("buy!")
		else:
			print("not hovering!")
