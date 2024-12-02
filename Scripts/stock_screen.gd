extends Area2D
class_name StockScreen

@export var value : float = 100.0
@export var volatility : float = 0.25
@export var updateTimer : float = 0.5

## News Impact Variables
var newsImpact : float = 0.0
var newsImpactTarget : float = 0.0
var newsImpactTimer : float = 0.0
var newsImpactEnable : bool = false

@export var highlight : ColorRect
@export var graph : Line2D
@export var nameLabel : Label
@export var priceLabel : Label

var timer : float = 0.0

var priceHistory : Array
var savedDiffValue : float = 0.0

func _ready():
	graph.clear_points()
	set_process(false)

func start():
	## Simulates 33 ticks of history to prep the graph.
	for i in range(33):
		var valueChange = randf_range(-0.1,0.1) * volatility * updateTimer * value
		value += valueChange
		priceHistory.append(value)
	updateValue(updateTimer)
	set_process(true)

func _process(delta):
	timer += delta
	if newsImpactEnable : newsHandler(delta)
	if timer > updateTimer:
		updateValue(timer)
		updateGraph()
		timer = 0

func updateGraph():
	## Updates the line graph based off past price history.
	# x-limits : 30, 350 (Increment by 10)
	# y-limits : 30, 220 (Higher number is down)
	var minValue : float = priceHistory.min()
	var maxValue : float = priceHistory.max()
	var diffValue = maxValue - minValue
	
	if diffValue != savedDiffValue:
		graph.clear_points()
		for i in range(33):
			var y = ((abs(((priceHistory[i] - minValue) / diffValue) - 1)) * 190) + 30
			graph.add_point(Vector2(30+(i*10), y))
	else:
		graph.remove_point(0)
		var y = ((abs(((priceHistory[32] - minValue) / diffValue) - 1)) * 190) + 30
		graph.add_point(Vector2(350, y))
	
func newsBreak(name : String, target : float):
	if name != nameLabel.text : return
	
	if newsImpactEnable == true : newsImpactTarget += target
	else : newsImpactTarget = target
	newsImpactEnable = true
	newsImpactTimer = 0.0

func newsHandler(delta : float):
	## Spikes to the target impact within 10 seconds, then gradually resets to 0 impact after 30 total seconds. This is using a cubic bezier method.
	## TODO Edgecase of interrupted new ticker
	var impact = Vector2(0,0)
	var impactLeftPull = Vector2(-5,newsImpactTarget*2)
	var impactTarget = Vector2(5,newsImpactTarget*0.5)
	var impactTargetEnd = Vector2(10,0)
	
	var leftMidpoint = impact.lerp(impactLeftPull, newsImpactTimer/30)
	var topMidpoint = impactLeftPull.lerp(impactTarget, newsImpactTimer/30)
	var rightMidpoint = impactTarget.lerp(impactTargetEnd, newsImpactTimer/30)
	
	var secondLeftMidpoint = leftMidpoint.lerp(topMidpoint, newsImpactTimer/30)
	var secondRightMidpoint = topMidpoint.lerp(rightMidpoint, newsImpactTimer/30)
	
	newsImpact = secondLeftMidpoint.lerp(secondRightMidpoint, newsImpactTimer/30).y
	newsImpactTimer += delta
	if newsImpactTimer > 30.0 : newsImpactEnable = false

func updateValue(timeSinceUpdate):
	var valueChange = randf_range(-0.1,0.1) * volatility * timeSinceUpdate * value
	if abs(newsImpact) > 1 : valueChange += abs(valueChange) * newsImpact
	value += valueChange
	priceHistory.pop_front()
	priceHistory.append(value)
	
	if value < 0.01 : value = 0.01
	if priceLabel : priceLabel.text = "$" + str(value).pad_decimals(2)

func _on_body_entered(body):
	if body is Player:
		print(body)
		highlight.set_modulate(Color(1,1,1,0.4))

func _on_body_exited(body):
	if body is Player:
		print(body)
		highlight.set_modulate(Color(0.6,0.6,0.6,0))
