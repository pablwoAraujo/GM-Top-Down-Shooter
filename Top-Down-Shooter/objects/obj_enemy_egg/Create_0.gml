/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Quando a animação terminar, o ovo choca e vira um inimigo
hatch = function() {
	// Checa se a animação já chegou ao fim
	if (image_index >= image_number - 1) {
		// O objeto ovo vira o objeto small_enemy
		instance_change(obj_small_enemy, true);
	}
}
