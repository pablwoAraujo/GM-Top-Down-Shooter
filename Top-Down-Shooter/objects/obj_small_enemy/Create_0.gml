/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Herdando as informações do pai
event_inherited();

// Distância limite que o obj vai seguir o player
range_to_follow = 200;

// Seguindo o jogador
follow_the_player = function() {
	// Checando se o player existe
	if (instance_exists(obj_player)) {
		// Pegando a distância até o player
		var _distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

		// Se a distância do obj até o player for menor que o range
		if (_distance_to_player <= range_to_follow) {
			// Pegando a direção do player
			var _dir = point_direction(x,y, obj_player.x, obj_player.y);
			// Setando a direção do obj
			direction = _dir;

			// Definindo uma velocidade padrão
			speed = 1;
		}
	}
}