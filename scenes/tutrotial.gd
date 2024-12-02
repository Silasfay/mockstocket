extends Control
@export var mainmenu : PackedScene
var PlayerCount = 0 
var playerTouch = 0
var playerBuy = 0 
var playerSell = 0 



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#this toggles on and off the "tutorial" as the players do it 
	if PlayerCount == playerTouch: 
		$HBoxContainer/VBoxContainer/Label.set_visible(false)
		$HBoxContainer/VBoxContainer/Label2.set_visible(false)
		$HBoxContainer/VBoxContainer/Label3.set_visible(true)
	if playerBuy and playerSell == PlayerCount:
		$HBoxContainer/VBoxContainer/Label3.set_visible(false)
		$HBoxContainer/VBoxContainer/Label4.set_visible(true)


func _on_stock_screen_body_entered(body: Node2D) -> void:
	playerTouch+= 1


func _on_stock_screen_body_exited(body: Node2D) -> void:
	playerTouch-= 1
	
func get_array(array:Array):
	for each in array:
		add_child(array[each])
