extends RigidBody2D

const max_speed = 8


var hasWon : bool = false
var stockInv : Array[int] = [0,0,0,0]
var money : float = 1000

var input = Vector2.ZERO

func _process(delta: float) -> void:
	position += Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * max_speed # set up func to not let them run offscreen
	if Input.is_action_just_pressed("buy"):
		print("works") 

func _on_stock_screen_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	get_node("/root/Main").pass_in_coords(position)
	print("working5") # Replace with function body.

func _on_stock_screen_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("working6") # Replace with function body.
