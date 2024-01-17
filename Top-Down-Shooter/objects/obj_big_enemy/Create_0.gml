/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Herdando as informações do pai
event_inherited();

// Vida do inimigo
life = 10;

// Tamanho do tremor
shake = 20;

// Velocidade máxima do inimigo
maximum_speed = 2;

// Tempo minímo para mudar o movimento e por ovos
minimum_time = 10;

// Tempo minímo para mudar o movimento e por ovos
maximum_time = 15;

// Número minímo de partes geradas pela explosão
minimum_number_of_parts = 15;

// Número máximo de partes geradas pela explosão
maximum_number_of_parts = 20;

// Contagem regressiva para o inimigo por ovos
countdown_to_lay_eggs = room_speed * random_range(minimum_time, maximum_time);

// Colocando ovos de inimigos
laying_eggs = function() {
	// Decrementando o countdown
	countdown_to_lay_eggs --;

	// Se a contagem regressiva chegar ao fim
	if (countdown_to_lay_eggs <= 0) {
		// Crie uma instância do ovo
		instance_create_layer(x, y, layer, obj_enemy_egg);
		
		// Resetando o countdown
		countdown_to_lay_eggs = room_speed * random_range(minimum_time, maximum_time);
	}
}
