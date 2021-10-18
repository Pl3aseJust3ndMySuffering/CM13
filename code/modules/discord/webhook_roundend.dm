/decl/webhook/roundend
	id = WEBHOOK_ROUNDEND

// Data expects three numerical fields: "ghosts", "clients"
/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Раунд закончился.\n"
	if(data)
		desc += "Мертвые: **[data["ghosts"]]**\n"
		desc += "Онлайн: **[data["clients"]]**\n"
		desc += "Длительность раунда: **[round(world.time / 36000)]:[add_zero(world.time / 600 % 60, 2)]:[world.time / 100 % 6][world.time / 100 % 10]**"

	.["embeds"] = list(list(
	//	"title" = global.end_credits_title,
		"title" = "Раунд закончился",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))