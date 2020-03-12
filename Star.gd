extends Area2D

signal star_collected

func _ready():
	$Sprite.play("idle")

func _on_Star_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("star_collected")
		$Sprite/AnimationPlayer.play("collect")
		$CollisionShape2D.queue_free()
		$AudioNode/StarAudio.play()
