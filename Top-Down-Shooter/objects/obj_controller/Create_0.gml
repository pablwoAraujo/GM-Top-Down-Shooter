/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Distância miníma das bordas da room que os objetos devem ser gerados 
safety_margin = 100;

// Iniciando a room
getting_started = function() {
	// Criando o screenshake
	instance_create_layer(0, 0, layer, obj_screenshake);
	
	// Criando o player em uma posição aleatória
	var _x = irandom_range(safety_margin, room_width - safety_margin);
	var _y = irandom_range(safety_margin, room_height - safety_margin);
	
	instance_create_layer(_x, _y, "Player", obj_player);
}