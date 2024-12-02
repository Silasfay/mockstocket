extends Node
class_name Portfolio

@export var playerName : Label
@export var fundsLabel : Label
@export var ownedStockLabel : RichTextLabel
@export var funds : float = 10000

var playerNode : Player
var ownedStock : Dictionary

func _ready():
	if playerNode:
		self.modulate = playerNode.playerColor
		playerName.text = "Player %1d" % playerNode.playerNumber
	if funds : fundsLabel.text = "$" + "%0.2f" % funds
	ownedStockLabel.text = ""

func updateOwnedStock():
	for each in ownedStock :
		if ownedStock[each] == 0:
			ownedStock.erase(each)
	ownedStockLabel.text = ""
	for each in ownedStock:
		ownedStockLabel.append_text(each + ": " + str(ownedStock[each]))
		ownedStockLabel.newline()
	if funds : fundsLabel.text = "$" + "%0.2f" % funds
	

func buyStock(cost : float, stock : String):
	if funds > cost :
		funds -= cost
		if ownedStock.has(stock):
			ownedStock[stock] += 1
		else:
			ownedStock[stock] = 1
		updateOwnedStock()
		
func sellStock(cost : float, stock : String):
	if ownedStock.has(stock):
		funds += cost
		ownedStock[stock] -= 1
		updateOwnedStock()
		
