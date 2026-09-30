extends Control

@onready var texto = $Panel/Label

func _ready():
	texto.text = "Alien: Humano... por favor... nossa nave caiu. As peças do radar se espalharam..."
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "Alien: ...nós perdemos o nosso Ovo Alienígena também. Você precisa nos ajudar..."
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "Fazendeiro: Eu vou te ajudar amiguinho espacial! Fica tranquilo."
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "Fazendeiro: Eu recupero suas peças e vou encontrar o ovo!"
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "Alien: Tome cuidado! Os agentes do governo estão fiscalizando a área."
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "Fazendeiro: Deixa comigo!"
	await get_tree().create_timer(4.0).timeout
	
	Global.missao_iniciada = true
	
	get_tree().change_scene_to_file("res://cenario1.tscn")
