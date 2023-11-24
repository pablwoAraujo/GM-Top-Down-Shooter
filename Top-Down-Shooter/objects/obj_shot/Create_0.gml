/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Iniciando maior
image_xscale = 3;
image_yscale = image_xscale;

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
