/decl/webhook/roundprep
	id = WEBHOOK_ROUNDPREP

// Data expects "url" and field pointing to the current hosted server and port to connect on.
/decl/webhook/roundprep/get_message(var/list/data)
	. = ..()
	var/desc = "Сервер запущен!\n"
	if(data && data["map"])
		desc += "Карта: **[data["map"]]**\n"
	if(data && data["url"])
		desc += "Адрес: <[data["url"]]>"

	.["embeds"] = list(list(
		"title" = "Новый раунд скоро начнется.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))