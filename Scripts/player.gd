extends CharacterBody2D

@export var speed := 500 #Pixels per second


var Portfolio
var Currency

func _process(delta: float) -> void:
	var movementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = movementDirection * speed
	move_and_slide()
	#position = (position+movement).clamp()
	if Input.is_action_just_pressed("buy"):
		print("works") 

func _on_stock_screen_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	get_node("/root/Main").pass_in_coords(position)
	print("working5") # Replace with function body.

func _on_stock_screen_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("working6") # Replace with function body.
