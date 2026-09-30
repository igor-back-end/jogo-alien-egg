extends Control

@onready var imagem = $TextureRect
@onready var texto = $Panel/Label

func _ready():
	imagem.texture = load("res://cutscenes/queda.png")
	texto.text = "ALERTA CRÍTICO: Falha total nos motores de propulsão!"
	await get_tree().create_timer(4.0).timeout 
	
	texto.text = "ATENÇÃO: A carga principal foi ejetada durante a queda..."
	await get_tree().create_timer(4.0).timeout
	
	imagem.texture = load("res://cutscenes/avistamento.png")
	texto.text = "Eita... O que é aquilo caindo no meu pasto? Uma estrela cadente verde?!"
	await get_tree().create_timer(4.0).timeout
	
	texto.text = "É melhor eu pegar na minha lanterna e ir dar uma olhada..."
	await get_tree().create_timer(4.0).timeout
	
	get_tree().change_scene_to_file("res://cenario1.tscn")
