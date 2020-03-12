extends Area2D

signal coin_collected
#kada objekt iz grupe Player skupi novcic emitira se signal coin_colected i vrte animacije novcica
func _on_Coin_body_entered(body):
	#if "Player" in body.name:
	if body.is_in_group("player"):
		$AnimationPlayer.play("anim")
		$CollisionShape2D.queue_free()
		emit_signal("coin_collected")
		$AudioNode/CoinAudio.play()
		
