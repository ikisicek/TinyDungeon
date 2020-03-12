extends Area2D

signal key_collected
#definira sto se dogodi kada objekt iz grupe player pokupi kljuc
func _on_Key_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("key_collected")
		$AnimationPlayer.play("anim")
		$CollisionShape2D.queue_free()
		$AudioNode/KeyAudio.play()
