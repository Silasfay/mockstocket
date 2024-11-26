extends Line2D

var maxVal : float = 200.00
var minVal : float = 00.00

var maxPoints : int = 7
var NewValue : float = randf_range(maxVal, minVal)
var PredictedVal : float
var movesXVal : int = -100 
var worth : float 

func _on_move_in_10_timeout() -> void:
	
	PredictedVal = randf_range(maxVal, minVal)
	add_point(Vector2(get_point_position(get_point_count()-1).x, NewValue))
	remove_point(0)
	worth = (NewValue -200) * -1 #inverts teh y value to make a "price"
	NewValue = PredictedVal # sets the predicted value to the upcoming value
	
	for i in 4:
		
		var xMove : float = get_point_position(i).x + movesXVal
		set_point_position(i, Vector2(xMove, get_point_position(i).y)) # moves everything over

func pass_worth():
	return worth
		
