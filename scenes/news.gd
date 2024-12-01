extends Control
@export var y_size : float

var newsFeedData = {
	01: {
		"Title" : "Gay Frogs?!??!?!1",
		"Content" : "I DON'T LIKE EM PUTTING CHEMICALS IN THE WATER THAT TURN THE FRIGGIN FROGS GAY!",
		"Stock" : "Frogs",
		"Impact" : -6
	}
}

var activeNewsFeed = [0,0,0,0,01]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_custom_minimum_size(Vector2(0,y_size))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
