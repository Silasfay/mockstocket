extends HBoxContainer
class_name PortfolioManager

@export var portfolioNode : PackedScene
var activePlayers : Array

func _ready():
	## Clears placeholder children.
	for each in get_children() : each.queue_free()

func start():
	for each in activePlayers:
		var newPortfolio : Portfolio = portfolioNode.instantiate()
		newPortfolio.playerNode = each
		each.portfolioNode = newPortfolio
		add_child(newPortfolio)
