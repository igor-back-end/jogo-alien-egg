extends Control

@onready var texto = $Panel/Label

func _ready():
	texto.text = "Alien: Você salvou a nossa espécie, Terráqueo. A galáxia inteira é eternamente grata!"
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "Fazendeiro: Voltem sempre! Mas da próxima vez, tentem pousar sem amassar o meu pasto!"
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "FIM DE JOGO!"
	await get_tree().create_timer(4.0).timeout
	
	Global.pecas_coletadas = 0
	Global.ids_pecas_pegas.clear()
	Global.missao_iniciada = false
	Global.posicao_fazendeiro = Vector2.ZERO
	
	get_tree().change_scene_to_file("res://menu_principal.tscn")
