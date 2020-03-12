extends Area2D

func _on_FreezeClock_body_entered(body):
	if "Player" in body.name:
		#body.freeze()
		$CollisionShape2D.queue_free()
		$AnimationPlayer.play("anim")
		get_parent().freezestart()
