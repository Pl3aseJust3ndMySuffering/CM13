/decl/webhook/roundstart
	id = WEBHOOK_ROUNDSTART

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = "Режим: **[global.master_mode]**\n"
	desc += "Онлайн: **[GLOB.clients.len]**"
	if(data && data["url"])
		desc += "\nАдрес: <[data["url"]]>"

	.["embeds"] = list(list(
		"title" = "Раунд начался.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))