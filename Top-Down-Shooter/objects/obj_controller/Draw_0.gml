/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Desenhando o ponteiro para o inimigo mais próximo
// Verificando se o player e o inimigo existem
if (instance_exists(obj_player) && instance_exists(obj_big_enemy)) {
	// Procurando o inimigo mais próximo
	// Rodando o código dentro do player
	with (obj_player) {
		// Capturando o inimigo mais próximo
		var _nearest_enemy = instance_nearest(x, y, obj_big_enemy);
		// Apontando para a direção do inimigo mais próximo
		var _direction = point_direction(x, y, _nearest_enemy.x, _nearest_enemy.y);

		// Capturando as dimensões da view
		var _view_width = camera_get_view_width(view_camera[0]);
		var _view_height = camera_get_view_height(view_camera[0]);

		// Capturando a posição da viewport na room
		var _position_x_view = camera_get_view_x((view_camera[0]));
		var _position_y_view = camera_get_view_y((view_camera[0]));
		
		// Capturando o ponto central da viewport
		var _ponto_central_x =  _position_x_view + _view_width/2
		var _ponto_central_y =  _position_y_view + _view_height/2

		// Calculando se o inimigo mais próximo esta fora da viewport
		var _x_out_of_view = abs(_nearest_enemy.x - _ponto_central_x) > _view_width/2;
		var _y_out_of_view = abs(_nearest_enemy.y - _ponto_central_y) > _view_height/2;

		// Verificando se o inimigo mais próximo esta fora da viewport
		if (_x_out_of_view || _y_out_of_view) {
			// Desenhando o ponteiro
			draw_sprite_ext(spr_pointer, 0, x, y, 1, 1, _direction, c_white, 0.5);
		}
	}
}