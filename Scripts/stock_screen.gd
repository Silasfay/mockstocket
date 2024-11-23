class_name StockScreen extends Area2D



# Constants for graph dimensions and styling
const MARGIN_PERCENT: float = 0.3  # 30% margin on top and bottom
const GRAPH_WIDTH: int = 350
const GRAPH_HEIGHT: int = 200
const MAX_HISTORY_AGE: float = 5.0  # Maximum age of data points in seconds
const MIN_POINTS_TO_KEEP: int = 2  # Minimum number of points to keep for drawing



# History tracking
class PricePoint:
	var price: float
	var timestamp: float
	
	func _init(p: float, t: float) -> void:
		price = p
		timestamp = t

# Node references
@onready var shape: CollisionShape2D = $CollisionShape2D
@onready var line: Line2D = $Line2D

var price_history: Array[PricePoint] = []
var all_time_high: float = -INF
var all_time_low: float = INF
var stock: Stock = null

func _ready() -> void:
	# Ensure required nodes exist
	assert(shape != null, "CollisionShape2D node not found")
	assert(line != null, "Line2D node not found")

func setStock(stock:Stock) -> void:
	self.stock = stock

func add_price_point(price: float) -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	price_history.append(PricePoint.new(price, current_time))
	
	# Update all-time values
	all_time_high = max(all_time_high, price)
	all_time_low = min(all_time_low, price)
	
	cleanup_history()
	update_graph()

func cleanup_history() -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	

	while price_history.size() > MIN_POINTS_TO_KEEP:
		var oldest_point = price_history[0]
		if current_time - oldest_point.timestamp > MAX_HISTORY_AGE:
			price_history.pop_front()
			recalculate_all_time_values()
		else:
			break

func recalculate_all_time_values() -> void:
	for point in price_history:
		all_time_high = max(all_time_high, point.price)
		all_time_low = min(all_time_low, point.price)



func update_graph() -> void:
	if price_history.size() < 2:
		return
		
	var value_range = all_time_high - all_time_low
	
	var margin = value_range * MARGIN_PERCENT
	var scaled_min = all_time_low - margin
	var scaled_max = all_time_high + margin
	var scaled_range = scaled_max - scaled_min
	
	var current_time = Time.get_ticks_msec() / 1000.0
	var oldest_time = price_history[0].timestamp
	var time_range = current_time - oldest_time
	

	while line.get_point_count() > price_history.size():
		line.remove_point(line.get_point_count() - 1)
	while line.get_point_count() < price_history.size():
		line.add_point(Vector2.ZERO)
	

	for i in price_history.size():
		var point = price_history[i]
		var x = ((point.timestamp - oldest_time) / time_range) * GRAPH_WIDTH
		var normalized_y = (point.price - scaled_min) / scaled_range
		var y = GRAPH_HEIGHT * (1.0 - normalized_y)  # Invert Y axis
		line.set_point_position(i, Vector2(x, y))

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.setHoverignStock(self.stock)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		if body.hoveredStock == self.stock:
			body.setHoverignStock(null)
