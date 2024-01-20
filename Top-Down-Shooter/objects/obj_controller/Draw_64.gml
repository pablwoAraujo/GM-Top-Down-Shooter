/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Quantidade de inimigos grandes
var _big_enemies = instance_number(obj_big_enemy);

// Exibindo a vida e o nível
draw_text(20, 20, "Life: " + string(global.life));
draw_text(20, 40, "Level: " + string(global.level));

// Exibindo a quantidade de inimigos grandes
draw_text(1120, 20, "Big Enemies: " + string(_big_enemies));
