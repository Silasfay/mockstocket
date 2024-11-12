class_name StockScreen extends Area2D

var shape :CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shape = $CollisionShape2D
	pass # Replace with function body.

func display(stock:Stock) -> void:
	$Line2D
	

func update(data) -> void:
	pass
	#print(data)

func _on_body_entered(body: Node2D) -> void:
	print(body)
	pass # Replace with function body.
