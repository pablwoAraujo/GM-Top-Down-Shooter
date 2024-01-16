/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.shake = 0;

// Treme a tela
screen_shake = function() {
	// Tremendo a tela com base no valor do shake
	view_xport[0] = random_range(-global.shake, global.shake);
	view_yport[1] = random_range(-global.shake, global.shake);
	
	// Se o valor do shake for maior que zero, decrementamos
	if (global.shake > 0) {
		global.shake  *= 0.9;
		// Se o valor estiver muito próximo de 0, ele deve ser zero
		if (global.shake <= 0.1) global.shake = 0;
	}
}