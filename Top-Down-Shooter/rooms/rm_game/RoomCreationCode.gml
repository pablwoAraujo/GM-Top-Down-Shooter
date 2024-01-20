// Criando o controlador se ele não existe
if (!instance_exists(obj_controller)) {
	instance_create_layer(0, 0, "player", obj_controller);
}
