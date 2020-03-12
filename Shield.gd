extends Area2D

func _on_Shield_body_entered(body):
	if "Player" in body.name:
		body.besmrtan()
		$CollisionShape2D.queue_free()
		$AnimationPlayer.play("anim") 
		$AudioNode/CoinAudio.play()
