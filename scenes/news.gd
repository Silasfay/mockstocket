extends PanelContainer
class_name News

@export var contentLabel : RichTextLabel
@export var flasher : ColorRect

var activeNewsContent : String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
var activeNewsType : String = "Placeholder"
var timer : float = 0.0
var timeToExpire : float = 10.0

func _ready():
	## Sets a random expiration time between 20-30 seconds for node to delete self.
	timeToExpire = randf_range(20,30)
	
	## Initializes content text, and preps it for typewriter animation.
	contentLabel.text = activeNewsContent
	contentLabel.visible_ratio = 0.0
	
	newsFlash()
	
func _process(delta):
	timer += delta
	if timer > timeToExpire :
		terminate()

func newsFlash():
	## Literally flashes the news white.
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(flasher, "modulate", Color(1,1,1,0.8), 0.1)
	tween.tween_property(flasher, "modulate", Color(1,1,1,0), 0.1).set_delay(0.1)
	
	## Typewriter effect
	var tween2 = create_tween()
	tween2.tween_property(contentLabel, "visible_ratio", 1.0, 2.0)
	
func terminate():
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "modulate", Color(1,1,1,0), 3)
	await get_tree().create_timer(3.5).timeout
	queue_free()
