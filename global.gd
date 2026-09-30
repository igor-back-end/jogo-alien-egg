extends Node

var voltar_pela_passagem = false
var posicao_jogador = Vector2.ZERO
var posicao_fazendeiro: Vector2 = Vector2.ZERO

var pecas_coletadas: int = 0
var ids_pecas_pegas: Array = []
var missao_iniciada: bool = false

func resetar_pecas():
	pecas_coletadas = 0
	ids_pecas_pegas.clear()
