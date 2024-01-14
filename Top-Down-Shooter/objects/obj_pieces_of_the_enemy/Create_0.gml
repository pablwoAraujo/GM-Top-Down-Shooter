/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Desaparecendo
disappearing = function(){
	// Diminuindo a transparência aos poucos
	image_alpha = clamp(image_alpha - 0.01, 0, 1);

	// Se a transparência chegar a 0 se destroi
	if (image_alpha <= 0) instance_destroy();
}
