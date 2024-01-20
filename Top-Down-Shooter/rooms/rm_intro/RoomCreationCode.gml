// Criando o controlador se ele não existe
if (!instance_exists(obj_menu_controller)) {
	instance_create_layer(0, 0, "Menu", obj_menu_controller);
}
