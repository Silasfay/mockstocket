extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func update(data) -> void:
	pass
	#print(data)

func _on_body_entered(body: Node2D) -> void:
	print(body)
	pass # Replace with function body.
