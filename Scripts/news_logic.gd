extends Node

var Oracle : Array[String]
var BadAdvice : Array[String]
var Slightly_ : Array[String]
var Tweets_ : Array[String]
var Snn : Array[String]
var ends : Array[String]
var Arrays : Array[Array]
var x : String
var choice : int
var trend : float
var name_label = Label.new()
var NewsOut : String 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Oracle = ["The Oracle states ", "misfortune", "great fortune", "slight fortune", "for "]
	BadAdvice = ["BadNewsCo projects that ","ends badly ", "soars gloriously ", "may fall ","may jump"]
	Slightly_ = ["Slighted News says that ", "dives ", "peaks ", "dips ", "rises" ]
	Snn = ["SNN predicts that ", "will fall ", "will crash","will rise", "will jump"]
	Tweets_ = ["Melon Eusks tweets that ","is worthless ","cant be beaten ", "is risky ","looks promising"]
	ends = [ "sometime soon ", "in the near future "]
	Arrays = [Oracle, BadAdvice, Slightly_, Snn, Tweets_]
	print(Arrays[choice][0] + Arrays[choice][2])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _create_news():
	trend = randf_range(-10,10)
	choice = randi_range(0,4) 
	var i = randi_range(1,3)
	if choice == 1:
		Arrays[choice][0] + Arrays[choice][i]
	else:
		if trend <=10 and trend >= 5:
			NewsOut = Arrays[choice][0] + Arrays[choice][2]
		if trend <=5 and trend >= 0:
			NewsOut = Arrays[choice][0] + Arrays[choice][4]
		if trend >=-10 and trend <= -5:
			NewsOut = Arrays[choice][0] + Arrays[choice][1]
		if trend >=-5 and trend <= 0:
			NewsOut = Arrays[choice][0] + Arrays[choice][3]
	name_label.text = NewsOut

	get_node("/root/Main/NewsBank").add_child(name_label)



func _on_timer_timeout() -> void:
	_create_news()
	
