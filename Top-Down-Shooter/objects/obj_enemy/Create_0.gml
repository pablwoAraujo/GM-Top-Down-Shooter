/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Countdown para mudar a direção do movimento
movement_direction_countdown = room_speed * random_range(4, 8);

// Distância limite que o obj vai seguir o player
range_to_follow = 200;

// Vida do inimigo
life = 1;

// Método para definir a velocidade e a direção do objeto
defines_the_movement = function() {
	// Definindo uma direção aleatória
	direction = irandom(359);
	// Definindo uma velocidade de 0 a 2
	speed = random(2);

	// Fazendo o objeto apontar para a direção do movimento
	image_angle = direction;
}

// Define o movimento do obj dentro da room, evitando que ele escape
movement_limit = function() {
	// Olhando na direção do movimento
	image_angle = direction;

	// Impedindo que ele escape na horizontal
	var _escaping_left = (x - sprite_width/2 < 0)
	var _escaping_right = (x + sprite_width/2 > room_width)

	if (_escaping_left || _escaping_right) hspeed *= -1;

	// Impedindo que ele escape na vertical
	var _escaping_upward = (y - sprite_height/2 < 0 )
	var _escaping_down = (y + sprite_height/2 > room_height)

	if (_escaping_upward || _escaping_down) vspeed *= -1;
}

// Diminuindo o tempo do countdown
decreasing_the_countdown = function() {
	movement_direction_countdown --;

	if (movement_direction_countdown <= 0) {
		// Define uma nova direção e velocidade
		defines_the_movement();

		// Redefine o countdown
		movement_direction_countdown = room_speed * random_range(4, 8);
	}
}

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

// Levando dano
take_damage = function(_damage) {
	// Garantindo um dano mínimo
	if (_damage == undefined || _damage <= 0) {
		damage = 1;
	}
	// Perdendo vida
	life -= _damage;
	// Destruindo o obj se a vida for zerada
	if (life <= 0) {
		instance_destroy();
		// Explodindo
		explode();
	}
}

// Explodindo
explode = function() {
	// Criando o vestígio do inimigo
	var _remains = instance_create_layer(x, y, layer, obj_remains_of_the_enemy);
	_remains.image_angle = direction;

	// Criando um número aleatório de pedaços
	var _amount = irandom_range(6, 10);
	
	repeat(_amount) {
		// Instanciando um pedaço
		var _piece = instance_create_layer(x, y, layer, obj_pieces_of_the_enemy);

		// Dando velocidade ao pedaço
		_piece.speed = random_range(4, 6);
		// Dando uma direção aleatória ao pedaco
		_piece.direction = irandom(359);
		// Apontando ele na direção correta
		_piece.image_angle = _piece.direction;
	}
}

defines_the_movement();
