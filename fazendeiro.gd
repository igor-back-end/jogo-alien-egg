extends CharacterBody2D

@onready var label_contador = $CanvasLayer/Label

const SPEED = 200.0
const JUMP_VELOCITY = -420.0 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ta_escondido = false

func _ready():
	if Global.voltar_pela_passagem == true:
		global_position = Vector2(25, 500) 
		Global.voltar_pela_passagem = false 
		
	elif Global.posicao_jogador != Vector2.ZERO:
		global_position = Global.posicao_jogador
		Global.posicao_jogador = Vector2.ZERO 

func _physics_process(delta):
	if Global.missao_iniciada == true:
		label_contador.show() 
		label_contador.text = "Peças coletadas: " + str(Global.pecas_coletadas) + "/3"
	else:
		label_contador.hide() 

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		$Sprite2D.flip_h = direction < 0
		$AnimationPlayer.play("andar")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimationPlayer.stop()
		$Sprite2D.frame = 0

	move_and_slide()

func _on_saida_cenario_1_para_3_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(50, 400) 
		get_tree().change_scene_to_file("res://cenario3.tscn")


func _on_saida_cenario_1_para_2_body_entered(body: Node2D) -> void:
	print("Encostou no portal do Cenario 2! Quem bateu: ", body.name)
	
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(1050, 500) 
		get_tree().change_scene_to_file("res://cenario2.tscn")


func _on_saida_cenario_2_para_4_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(150, 200) 
		
		get_tree().change_scene_to_file("res://cenario4.tscn")


func _on_limbo_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.resetar_pecas()
		get_tree().change_scene_to_file("res://game_over.tscn")


func _on_saida_cenario_4_para_5_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(20, 500) 
		
		get_tree().change_scene_to_file("res://cenario5.tscn")


func _on_retorno_cenario_2_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(70, 500) 
		
		get_tree().change_scene_to_file("res://cenario2.tscn")


func _on_retorno_cenario_4_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(1000, 500) 
		
		get_tree().change_scene_to_file("res://cenario4.tscn")


func _on_retorno_cenario_2_para_1_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(100, 500) 
		
		get_tree().change_scene_to_file("res://cenario1.tscn")


func _on_retorno_cenario_3_para_1_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(1080, 500) 
		
		get_tree().change_scene_to_file("res://cenario1.tscn")

func _on_saida_cenario_5_para_final_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.posicao_jogador = Vector2(100, 250) 
		
		get_tree().change_scene_to_file("res://cenario_final.tscn")


func _on_zona_abducao_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		body.set_physics_process(false)

		var arvore_do_jogo = get_tree()
		
		$"../AnimationPlayer".play("abducao")
		
		await $"../AnimationPlayer".animation_finished
		
		arvore_do_jogo.change_scene_to_file("res://cena_final.tscn") 
		
