extends Control

@export var creditsTrigger : Area2D
@export var creditsNode : Control
@export var persistTrigger : Area2D
@export var settingsTrigger : Area2D

var midAnimation : bool = false
var creditsShown : bool = false
var playerCount : int = 0

func _process(_delta):
	if playerCount <= 0 and !midAnimation and creditsShown:
		var tween = create_tween()
		midAnimation = true
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(creditsNode, "position", Vector2(0,20), 0.3)
		await get_tree().create_timer(0.3).timeout
		creditsShown = false
		midAnimation = false

func _on_area_2d_body_entered(body):
	if body is Player:
		if !midAnimation:
			var tween = create_tween()
			midAnimation = true
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(creditsNode, "position", Vector2(0,-380), 0.3)
			await get_tree().create_timer(0.3).timeout
			creditsShown = true
			midAnimation = false
		
	

func _on_persist_trigger_body_entered(body):
	if body is Player:
		playerCount += 1

func _on_persist_trigger_body_exited(body):
	if body is Player:
		playerCount -= 1

func _on_settings_trigger_body_entered(body):
	pass # Replace with function body.


func _on_settings_trigger_body_exited(body):
	pass # Replace with function body.
