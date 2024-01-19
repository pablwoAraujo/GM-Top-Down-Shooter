/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Se o pedaço deve dar dano ou não nos inimigos
deal_damage = false;

// Desaparecendo
disappearing = function(){
	// Diminuindo a velocidade aos poucos
	speed = lerp(speed, 0, 0.03);
	// Diminuindo a transparência aos poucos
	image_alpha = clamp(image_alpha - 0.01, 0, 1);

	// Se a transparência chegar a 0 se destroi
	if (image_alpha <= 0) instance_destroy();
}

// Colidindo com os inimigos
collision = function() {
	if (deal_damage) {
		// Checando se ouve a colisão
		var _enemy = instance_place(x, y, obj_enemy);

		if (_enemy) {
			// Dando dano nos inimigos
			_enemy.take_damage(1);
			// Se destruindo
			instance_destroy();
		}
	}
}
