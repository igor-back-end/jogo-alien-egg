extends CharacterBody2D

@export var velocidade: float = 50.0
@export var limite_esquerda: float = 100.0
@export var limite_direita: float = 1000.0
@export var comeca_andando_pra_direita: bool = true

var direcao: int = 1
var gravidade = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimationPlayer.play("andar")

	if comeca_andando_pra_direita:
		direcao = 1
		$Sprite2D.flip_h = false
	else:
		direcao = -1
		$Sprite2D.flip_h = true
		if has_node("AreaVisao"):
			$AreaVisao.scale.x = -1

func _physics_process(delta):
	velocity.x = direcao * velocidade

	if not is_on_floor():
		velocity.y += gravidade * delta
		
	move_and_slide()
	
	if global_position.x > limite_direita:
		direcao = -1
		$Sprite2D.flip_h = true
		if has_node("AreaVisao"):
			$AreaVisao.scale.x = -1
			
	elif global_position.x < limite_esquerda:
		direcao = 1
		$Sprite2D.flip_h = false
		if has_node("AreaVisao"):
			$AreaVisao.scale.x = 1

func _on_area_visao_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		if body.ta_escondido:
			print("Perito passou reto, fazendeiro invisível na moita!")
		else:
			print("GAME OVER! Perito te detectou!")
			
			Global.resetar_pecas()
			get_tree().change_scene_to_file("res://game_over.tscn")
