extends Node2D

var stocks = [get_node("/root/Main/StockScreen")]

var pos = Vector2.ZERO


func pass_in_coords(x: Vector2): 
	pos = x
	
	
func Check_quad():
	pass


func _on_stock_screen_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
	print("works") # Replace with function body.
