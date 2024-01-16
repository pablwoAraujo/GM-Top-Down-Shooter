/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Vida do inimigo (default)
life = 3;

// Tamanho do tremor (default)
shake = 10;

// Velocidade máxima do inimigo (default)
maximum_speed = 2;

// Tempo minímo para mudar o movimento (default)
minimum_time = 4;

// Tempo minímo para mudar o movimento (default)
maximum_time = 8;

// Número minímo de partes geradas pela explosão (default)
minimum_number_of_parts = 6;

// Número máximo de partes geradas pela explosão (default)
maximum_number_of_parts = 10;

// Countdown para mudar a direção do movimento
movement_direction_countdown = room_speed * random_range(minimum_time, maximum_time);

// Método para definir a velocidade e a direção do objeto
defines_the_movement = function() {
	// Definindo uma direção aleatória
	direction = irandom(359);
	// Definindo uma velocidade de 0 a 2
	speed = random(maximum_speed);

	// Fazendo o objeto apontar para a direção do movimento
	image_angle = direction;
}

// Diminuindo o tempo do countdown
decreasing_the_countdown = function() {
	movement_direction_countdown --;

	if (movement_direction_countdown <= 0) {
		// Define uma nova direção e velocidade
		defines_the_movement();

		// Redefine o countdown
		movement_direction_countdown = room_speed * random_range(minimum_time, maximum_time);
	}
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
		
		// Fazendo a tela tremer
		// Vertificando se o valor novo é maior que o atual
		if (global.shake < shake) global.shake = shake;
	}
}

// Explodindo
explode = function() {
	// Criando o vestígio do inimigo
	var _remains = instance_create_layer(x, y, layer, obj_remains_of_the_enemy);
	_remains.image_angle = direction;

	// Criando um número aleatório de pedaços
	var _amount = irandom_range(minimum_number_of_parts, maximum_number_of_parts);
	
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
