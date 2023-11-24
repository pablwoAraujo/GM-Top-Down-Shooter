/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Definindo as variáveis de controle do player
player_speed = 5;
speed_x = 0;
speed_y = 0;

// Definindo as variáveis de controle do disparo
shot_speed = 10;
shot_countdown = 0;
shot_waiting_time = room_speed * 0.2;

/// @function				mov();
/// @description			Controla a movimentação do player.
mov = function() {
	// Definindo as variáveis de movimentação
	var _up, _right, _down, _left;

	// Capturando os inputs do player
	_up = keyboard_check(ord("W"));
	_right = keyboard_check(ord("D"));
	_down = keyboard_check(ord("S"));
	_left = keyboard_check(ord("A"));

	// Calculando as velocidades do player no eixo x e y
	speed_y = (_down - _up) * player_speed;
	speed_x = (_right - _left) * player_speed;

	// Movimentando o player
	x += speed_x;
	y += speed_y;

	// Controlando a velocidade da animação
	// Se o player estiver em movimento
	if (speed_y != 0 or speed_x != 0) {
		// liga a animação
		image_speed = 1;
	} else {
		// Se não, para a animação
		image_index = 2;
		image_speed = 0;
	}
}

/// @function				shooting();
/// @description			Controla o mouse e os disparos do player.
shooting = function() {
	// Captura o click no mouse esquerdo
	var _mb_left = mouse_check_button(mb_left);

	// Captura a direção que o mouse esta apontando
	var _dir = point_direction(x, y, mouse_x, mouse_y);

	// Altera o ângulo da sprite a partir da direção
	image_angle = _dir;

	// Checa se o countdown do tiro chegou a zero
	if (shot_countdown <= 0) {
		// Voltando para a sprite normal
		sprite_index = spr_player;

		// Checa se o mouse está sendo pressionado
		if (_mb_left) {
			// Cria o disparo e guarda na variável
			var _shot = instance_create_layer(x, y, "Shots", obj_shot);	

			// Definindo a direção, ângulo e velocidade do disparo
			_shot.direction = _dir;
			_shot.image_angle = _dir;
			_shot.speed = shot_speed;

			// Resetando o countdown do tiro
			shot_countdown = shot_waiting_time;

			// Trocando a sprite do player
			sprite_index = spr_player_shooting;
		}
	} else {
		// Se o countdown é maior que zero então decremente
		shot_countdown --;
	}
	
}