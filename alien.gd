extends Area2D

var interagiu = false

func _on_body_entered(body):
	if body.name == "fazendeiro" and Global.missao_iniciada == false:
		
		Global.posicao_fazendeiro = body.global_position
		get_tree().change_scene_to_file("res://conversa_alien.tscn")
			
		Global.missao_iniciada = true
	
