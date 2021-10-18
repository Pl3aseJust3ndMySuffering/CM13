SUBSYSTEM_DEF(webhooks)
	name = "Webhooks"
	init_order = INIT_ORDER_WEBHOOKS
	flags = SS_NO_FIRE
	var/list/webhook_decls = list()

/datum/controller/subsystem/webhooks/Initialize()
	load_webhooks()
	. = ..()

/datum/controller/subsystem/webhooks/proc/load_webhooks()

	if(!fexists(HTTP_POST_DLL_LOCATION))
		log_debug("Unable to locate HTTP POST lib at [HTTP_POST_DLL_LOCATION], webhooks will not function on this run.")
		return

	var/list/all_webhooks_by_id = list()
	var/list/all_webhooks = decls_repository.get_decls_of_subtype(/decl/webhook)
	for(var/wid in all_webhooks)
		var/decl/webhook/webhook = all_webhooks[wid]
		if(webhook.id)
			all_webhooks_by_id[webhook.id] = webhook

	webhook_decls.Cut()
	var/webhook_config = safe_file2text("config/webhooks.json")
	if(webhook_config)
		for(var/webhook_data in cached_json_decode(webhook_config))
			var/wid = webhook_data["id"]
			var/wurl = webhook_data["url"]
			var/list/wmention = webhook_data["mentions"]
			if(wmention && !islist(wmention))
				wmention = list(wmention)
			log_debug("Setting up webhook [wid].")
			if(wid && wurl && all_webhooks_by_id[wid])
				var/decl/webhook/webhook = all_webhooks_by_id[wid]
				webhook.urls = islist(wurl) ? wurl : list(wurl)
				for(var/url in webhook.urls)
					if(!webhook.urls[url])
						webhook.urls[url] = list()
					else if(!islist(webhook.urls[url]))
						webhook.urls[url] = list(webhook.urls[url])
				if(wmention)
					webhook.mentions = wmention?.Copy()
				webhook_decls[wid] = webhook
				log_debug("Webhook [wid] ready.")
			else
				log_debug("Failed to set up webhook [wid].")

/datum/controller/subsystem/webhooks/proc/send(var/wid, var/wdata)
	var/decl/webhook/webhook = webhook_decls[wid]
	if(webhook)
		if(webhook.send(wdata))
			to_world_log("Sent webhook [webhook.id].")
			log_debug("Webhook sent: [webhook.id].")
		else
			to_world_log("Failed to send webhook [webhook.id].")
			log_debug("Webhook failed to send: [webhook.id].")

/hook/roundstart/proc/run_webhook()
	SSwebhooks.send(WEBHOOK_ROUNDSTART, list("url" = get_world_url()))
	return 1