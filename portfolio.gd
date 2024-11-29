extends Node
var portolio
var Labels
var ID
var Bank
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	#portolio = get_node("/Main/player").get_portfolio
	Labels = [get_child(1),get_child(2),get_child(3),get_child(4)]
	for i in 4:
		Labels[i].text = "0"
	Bank = get_child(5)
	Bank.text = "2000"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_port_buy(ID:int, Amount: int,Money:float):
	var moneys = floor(Money *100) /100
	Labels[ID].text = str(Amount)
	Bank.text = str(moneys)
