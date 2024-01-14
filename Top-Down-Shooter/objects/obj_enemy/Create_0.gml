/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

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
	escaping_left = (x - sprite_width/2 < 0)
	escaping_right = (x + sprite_width/2 > room_width)

	if (escaping_left || escaping_right) hspeed *= -1;

	// Impedindo que ele escape na vertical
	escaping_upward = (y - sprite_height/2 < 0 )
	escaping_down = (y + sprite_height/2 > room_height)

	if (escaping_upward || escaping_down) vspeed *= -1;
}

defines_the_movement();
