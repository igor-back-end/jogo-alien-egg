extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		body.ta_escondido = true
		# Aplica a transparência diretamente no personagem
		body.modulate.a = 0.5 

func _on_body_exited(body: Node2D) -> void:
	if body.name == "fazendeiro":
		body.ta_escondido = false
		# Retorna o personagem à opacidade normal
		body.modulate.a = 1.0
