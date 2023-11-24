/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Definindo as variáveis de controle
player_speed = 5;
speed_x = 0;
speed_y = 0;

/// @function				mov();
/// @description			Controla a movimentação do player.
mov = function(){
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
}