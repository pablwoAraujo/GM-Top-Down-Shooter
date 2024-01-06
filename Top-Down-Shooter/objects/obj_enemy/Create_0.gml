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

defines_the_movement();
