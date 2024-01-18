/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Nível do jogo
global.level = 1;

// Distância miníma das bordas da room que os objetos devem ser gerados 
safety_margin = 100;

// Iniciando a room
getting_started = function() {
	// Alterando as dimensões da room
	var _width = irandom_range(2000, 5000);
	var _height = irandom_range(2000, 5000);
	
	room_width = _width;
	room_height = _height;
	
	// Criando o screenshake
	instance_create_layer(0, 0, layer, obj_screenshake);

	// Criando o player em uma posição aleatória
	var _positions = generate_random_positions();
	instance_create_layer(_positions[0], _positions[1], "Player", obj_player);
	
	// Criando os inimigos dentro da room
	spawns_enemies();
}

// Gera inimigos dentro da room
spawns_enemies = function() {
	// Quantidade de inimigos gerados de acordo com o nível do jogo
	var _quant = irandom_range(3, 7) * global.level;

	repeat(_quant) {
		// Pegando uma posição aleatória
		var _positions = generate_random_positions();

		// Instanciando o inimigo
		var _enemy = instance_create_layer(_positions[0], _positions[1], "Enemies", obj_big_enemy);

		// Checando a distância para o player
		if (instance_exists(obj_player)) {
			var _distance = point_distance(_enemy.x, _enemy.y, obj_player.x, obj_player.y);

			// Se a distância for pequena o inimigo é destruído
			if (_distance < 300) {
				// Destruindo o inimigo sem executar o método destroy dele
				instance_destroy(_enemy, false);	
			}
		}
	}
}

// Gera um array com duas posições aleatórias dentro da room
generate_random_positions = function() {
	var _x = irandom_range(0 + safety_margin, room_width - safety_margin);
	var _y = irandom_range(0 + safety_margin, room_height - safety_margin);

	return [_x, _y];
}

// Passando para o próximo nível
next_level = function() {
	// Checa quantos inimigos grandes existem
	var _number_of_enemies = instance_number(obj_big_enemy);

	if (_number_of_enemies <= 0) {
		// Subindo de nível
		global.level ++;
		// Reiniciando a room
		room_restart();	
	}
}