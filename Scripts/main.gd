extends Node2D

var playerScene = load("res://scenes/player.tscn")
var stockHandlerScene = load("res://scenes/stock_handler.tscn")

var stockHandler

func _ready():
	var playerInstance = playerScene.instantiate()
	add_child(playerInstance)
	stockHandler = stockHandlerScene.instantiate()
	add_child(stockHandler)

func _process(delta: float) -> void:
	var stockInfo = stockHandler.dostuff()
	#stockScreen.Update(stockInfo)


	
	
func Check_quad():
	pass


func _on_stock_screen_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
	print("works") # Replace with function body.
