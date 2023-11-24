/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Definindo as variáveis de controle
time_until_destruction = room_speed * 3;

// Iniciando maior
image_xscale = 3;
image_yscale = image_xscale;

/// @function				self_destruction();
/// @description			Se autodestroi depois de um tempo.
self_destruction = function() {
	time_until_destruction --;
	
	if (time_until_destruction <= 0) instance_destroy();
}

/// @function				decreasing_size();
/// @description			Volta a escala da imagem ao normal.
decreasing_size = function() {
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = image_xscale;
}

/// @function				adding_shooting_effect();
/// @description			Adiciona o efeito de brilho.
adding_shooting_effect = function() {
	// Se desenhando
	draw_self();

	// Mudando o blend mode
	gpu_set_blendmode(bm_add);

	// Desenha o efeito de brilho
	draw_sprite_ext(spr_shooting_effect, 0, x, y, image_xscale * 1.1, image_yscale * 1.1, image_angle, c_blue, 0.7);

	// Resetando o blend mode
	gpu_set_blendmode(bm_normal);
}
