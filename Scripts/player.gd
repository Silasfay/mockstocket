extends CharacterBody2D

var speed := 500 #Pixels per second


var Portfolio
var Currency

func _process(delta: float) -> void:
	var movementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = movementDirection * speed
	move_and_slide()
	#position = (position+movement).clamp()
	if Input.is_action_just_pressed("buy"):
		print("works") 
