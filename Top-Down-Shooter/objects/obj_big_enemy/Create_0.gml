/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Countdown para mudar a direção do movimento
movement_direction_countdown = room_speed * random_range(5, 15);

// Vida do inimigo
life = 10;

// Tamanho do tremor
shake = 20;

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

defines_the_movement();