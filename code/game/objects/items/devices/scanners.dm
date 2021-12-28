/*
CONTAINS:
T-RAY
DETECTIVE SCANNER
HEALTH ANALYZER
GAS ANALYZER
PLANT ANALYZER
MASS SPECTROMETER
REAGENT SCANNER
FORENSIC SCANNER
*/
/obj/item/device/t_scanner
	name = "\improper T-ray scanner"
	desc = "A terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	icon_state = "t-ray0"
	var/on = 0
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_SMALL
	item_state = "electronic"

	matter = list("metal" = 150)

/obj/item/device/t_scanner/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/device/t_scanner/attack_self(mob/user)
	..()
	on = !on
	icon_state = "t-ray[on]"

	if(on)
		START_PROCESSING(SSobj, src)


/obj/item/device/t_scanner/process()
	if(!on)
		STOP_PROCESSING(SSobj, src)
		return null

	for(var/turf/T in range(1, src.loc) )

		if(!T.intact_tile)
			continue

		for(var/obj/O in T.contents)

			if(O.level != 1)
				continue

			if(O.invisibility == 101)
				O.invisibility = 0
				O.alpha = 128
				spawn(10)
					if(O && !QDELETED(O))
						var/turf/U = O.loc
						if(U.intact_tile)
							O.invisibility = 101
							O.alpha = 255

		var/mob/living/M = locate() in T
		if(M && M.invisibility == 2)
			M.invisibility = 0
			spawn(2)
				if(M)
					M.invisibility = INVISIBILITY_LEVEL_TWO


/obj/item/device/healthanalyzer
	name = "\improper HF2 health analyzer"
	icon_state = "health"
	item_state = "analyzer"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject. The front panel is able to provide the basic readout of the subject's status."
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	flags_item = NOBLUDGEON
	throwforce = 3
	w_class = SIZE_SMALL
	throw_speed = SPEED_VERY_FAST
	throw_range = 10
	matter = list("metal" = 200)

	var/mode = 1
	var/hud_mode = 1
	var/last_scan

/obj/item/device/healthanalyzer/attack(mob/living/M, mob/living/user)
	last_scan = M.health_scan(user, FALSE, mode, hud_mode)
	src.add_fingerprint(user)
	return

/obj/item/device/healthanalyzer/attack_self(mob/user)
	..()

	if (!last_scan)
		user.show_message("No previous scan found.")
		return

	switch (hud_mode)
		if (1)
			var/dat = last_scan
			dat = replacetext(dat, "\n", "<br>")
			dat = replacetext(dat, "\t", "&emsp;")
			dat = replacetext(dat, "class='warning'", "class='[INTERFACE_RED]'")
			dat = replacetext(dat, "class='scanner'", "class='[INTERFACE_RED]'")
			dat = replacetext(dat, "class='scannerb'", "style='font-weight: bold;' class='[INTERFACE_RED]'")
			dat = replacetext(dat, "class='scannerburn'", "class='[INTERFACE_ORANGE]'")
			dat = replacetext(dat, "class='scannerburnb'", "style='font-weight: bold;' class='[INTERFACE_ORANGE]'")
			show_browser(user, dat, name, "handscanner", "size=500x400")
		if (0)
			user.show_message(last_scan)

	return


/obj/item/device/healthanalyzer/verb/toggle_mode()
	set name = "Switch Verbosity"
	set category = "Object"
	set src in usr
	mode = !mode
	switch (mode)
		if(1)
			to_chat(usr, "The scanner now shows specific limb damage.")
		if(0)
			to_chat(usr, "The scanner no longer shows limb damage.")

/obj/item/device/healthanalyzer/verb/toggle_hud_mode()
	set name = "Switch Hud"
	set category = "Object"
	set src in usr
	hud_mode = !hud_mode
	switch (hud_mode)
		if(1)
			to_chat(usr, "The scanner now shows results on the hud.")
		if(0)
			to_chat(usr, "The scanner no longer shows results on the hud.")

/obj/item/device/analyzer
	desc = "A hand-held environmental scanner which reports current gas levels."
	name = "analyzer"
	icon_state = "atmos"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20

	matter = list("metal" = 30,"glass" = 20)



/obj/item/device/analyzer/attack_self(mob/user as mob)
	..()

	if (user.stat)
		return
	if (!(istype(usr, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(usr, SPAN_DANGER("You don't have the dexterity to do this!"))
		return

	var/turf/location = user.loc
	if (!( istype(location, /turf) ))
		return

	var/env_pressure = location.return_pressure()
	var/env_gas = location.return_gas()
	var/env_temp = location.return_temperature()

	user.show_message(SPAN_NOTICE("<B>Results:</B>"), 1)
	if(abs(env_pressure - ONE_ATMOSPHERE) < 10)
		user.show_message(SPAN_NOTICE("Pressure: [round(env_pressure,0.1)] kPa"), 1)
	else
		user.show_message(SPAN_DANGER("Pressure: [round(env_pressure,0.1)] kPa"), 1)
	if(env_pressure > 0)
		user.show_message(SPAN_NOTICE("Gas Type: [env_gas]"), 1)
		user.show_message(SPAN_NOTICE("Temperature: [round(env_temp-T0C)]&deg;C"), 1)

	src.add_fingerprint(user)
	return

/obj/item/device/mass_spectrometer
	desc = "A hand-held mass spectrometer which identifies trace chemicals in a blood sample."
	name = "mass-spectrometer"
	icon_state = "spectrometer"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT|OPENCONTAINER
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20

	matter = list("metal" = 30,"glass" = 20)


	var/details = 0
	var/recent_fail = 0

/obj/item/device/mass_spectrometer/Initialize()
	. = ..()
	create_reagents(5)

/obj/item/device/mass_spectrometer/on_reagent_change()
	if(reagents.total_volume)
		icon_state = initial(icon_state) + "_s"
	else
		icon_state = initial(icon_state)

/obj/item/device/mass_spectrometer/attack_self(mob/user)
	..()

	if (user.stat)
		return
	if (crit_fail)
		to_chat(user, SPAN_DANGER("This device has critically failed and is no longer functional!"))
		return
	if (!(istype(user, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(user, SPAN_DANGER("You don't have the dexterity to do this!"))
		return


/obj/item/device/mass_spectrometer/adv
	name = "advanced mass-spectrometer"
	icon_state = "adv_spectrometer"
	details = 1


/obj/item/device/reagent_scanner
	name = "reagent scanner"
	desc = "A hand-held reagent scanner which identifies chemical agents."
	icon_state = "spectrometer"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 30,"glass" = 20)


	var/details = 0
	var/recent_fail = 0

/obj/item/device/reagent_scanner/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return
	if (user.stat)
		return
	if (!(istype(user, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(user, SPAN_DANGER("You don't have the dexterity to do this!"))
		return
	if(!istype(O))
		return
	if (crit_fail)
		to_chat(user, SPAN_DANGER("This device has critically failed and is no longer functional!"))
		return

	if(!QDELETED(O.reagents))
		var/dat = ""
		if(O.reagents.reagent_list.len > 0)
			var/one_percent = O.reagents.total_volume / 100
			for (var/datum/reagent/R in O.reagents.reagent_list)
				if(prob(reliability))
					dat += "\n \t \blue [R.name][details ? ": [R.volume / one_percent]%" : ""]"
					recent_fail = 0
				else if(recent_fail)
					crit_fail = 1
					dat = null
					break
				else
					recent_fail = 1
		if(dat)
			to_chat(user, SPAN_NOTICE(" Chemicals found: [dat]"))
		else
			to_chat(user, SPAN_NOTICE(" No active chemical agents found in [O]."))
	else
		to_chat(user, SPAN_NOTICE(" No significant chemical agents found in [O]."))

	return

/obj/item/device/reagent_scanner/adv
	name = "advanced reagent scanner"
	icon_state = "adv_spectrometer"
	details = 1

/obj/item/device/demo_scanner
	name = "demolitions scanner"
	desc = "A hand-held specially designed reagent scanner meant for analyzing bombs. It can report explosive and fire hazards from chemical containers and explosive casings, including explosive and fire intensity. However, it can not predict effects such as shrapnel or burn duration nor predict hazards caused from immediate chemical reactions."
	icon_state = "demolitions_scanner"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 30,"glass" = 20)
	var/scan_name = ""
	var/dat = ""
	var/ex_potential = 0
	var/int_potential = 0
	var/rad_potential = 0
	var/datum/reagents/holder

/obj/item/device/demo_scanner/afterattack(obj/O, mob/user as mob, proximity)
	if(!proximity)
		return
	if(user.stat)
		return
	if(!(istype(user, /mob/living/carbon/human) || SSticker) && SSticker.mode.name != "monkey")
		to_chat(user, SPAN_DANGER("You don't have the dexterity to do this!"))
		return
	if(!skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
		to_chat(user, SPAN_WARNING("You do not know how to use the [name]."))
		return
	if(!istype(O))
		return

	scan_name = O.name
	dat = ""
	ex_potential = 0
	int_potential = 0
	rad_potential = 0
	if(istype(O,/obj/item/explosive))
		var/obj/item/explosive/E = O
		if(!E.customizable)
			to_chat(user, SPAN_NOTICE("ERROR: This brand of explosive is under data protection. Scan has been cancelled."))
			return
		holder = E.reagents
		for(var/obj/container in E.containers)
			scan(container)
	else if(istype(O,/obj/item/ammo_magazine/rocket/custom))
		var/obj/item/ammo_magazine/rocket/custom/E = O
		if(!E.warhead)
			to_chat(user, SPAN_NOTICE("No warhead detected in [E]."))
			return
		holder = E.warhead.reagents
		for(var/obj/container in E.warhead.containers)
			scan(container)
	else if(istype(O,/obj/item/mortar_shell/custom))
		var/obj/item/mortar_shell/custom/E = O
		if(!E.warhead)
			to_chat(user, SPAN_NOTICE("No warhead detected in [E]."))
			return
		holder = E.warhead.reagents
		for(var/obj/container in E.warhead.containers)
			scan(container)
	else
		scan(O)
		if(O.reagents)
			holder = O.reagents
	if(dat && holder)
		if(ex_potential)
			dat += SPAN_ORANGE("<br>EXPLOSIVE HAZARD: ignition will create explosive detonation.<br>Potential detonation power: [min(ex_potential, holder.max_ex_power)]")
		if(int_potential)
			dat += SPAN_RED("<br>FIRE HAZARD: ignition will create chemical fire.<br>Expected fire intensity rating of [min(max(int_potential,holder.min_fire_int),holder.max_fire_int)] in a [min(max(rad_potential,holder.min_fire_rad),holder.max_fire_rad)] meter radius.")
		to_chat(user, SPAN_NOTICE("Chemicals found: [dat]"))
	else
		to_chat(user, SPAN_NOTICE("No active chemical agents found in [O]."))
	return

/obj/item/device/demo_scanner/proc/scan(var/obj/O)
	if(QDELETED(O.reagents))
		return
	if(O.reagents.reagent_list.len > 0)
		for(var/datum/reagent/R in O.reagents.reagent_list)
			dat += SPAN_BLUE("<br>[R.name]: [R.volume]u")
			if(R.explosive)
				ex_potential += R.volume*R.power
			if(R.chemfiresupp)
				int_potential += R.intensitymod * R.volume
				rad_potential += R.radiusmod * R.volume
	return dat

/obj/item/device/demo_scanner/attack_self(mob/user)
	..()

	if(!dat)
		to_chat(user, SPAN_NOTICE("No scan data available."))
		return
	if(alert(user,"Print latest scan?","[scan_name]","Yes","No") == "Yes")
		var/obj/item/paper/printing = new /obj/item/paper/()
		printing.name = scan_name
		printing.info = "Chemicals found: [dat]"
		user.put_in_hands(printing)

/obj/item/device/bioanalyzer
	name = "Bio Scanner"
	desc = "A hand-held specially designed bio scanner meant for analyzing foreign lifeforms and data. It can store bio data for exchanging points in RnD vendor."
	icon_state = "multitool2"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 50,"glass" = 50)

	var/SP = 0

/obj/item/device/bioanalyzer/attack_self(mob/user)
	..()

	to_chat(user, SPAN_NOTICE("Curruntly worth of research data points: [SP]."))
	var/E
	var/lg = length(bioscanned)
	var/cn = 0
	for(var/e in bioscanned)
		E += "[e]"
		cn++
		if(cn < lg)
			E += ", "
	to_chat(user, SPAN_NOTICE("Stored readings of corpses by this device: [length(bioscanned) > 0 ? "[E]" : "No data"]."))

/obj/item/device/bioanalyzer/attack(atom/movable/A, mob/living/user)
	if(isliving(A))
		var/mob/living/L = A
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
			var/PTG = 0
			if(!L.is_dead())
				to_chat(user, SPAN_DANGER("OH FUCK IT IS LIVING AND KICKING!"))
				return
			for(var/i in bioscanned)
				if(A == i)
					to_chat(user, SPAN_WARNING("[A] already scanned!"))
					return
			if(isYautja(A))
				PTG += 500
				to_chat(user, SPAN_DANGER("RnD has an interest in this foreign corpse's data! They awarded you with additional 500 points!"))
			else if(isXeno(A))
				var/mob/living/carbon/Xenomorph/x = A
				if(isXenoQueen(x))
					PTG += 600
					to_chat(user, SPAN_DANGER("RnD has a big interest in this corpse's data! They awarded you with additional 600 points!"))
				PTG += 50 * ((x.tier*x.tier + x.mob_size*0.3 + x.maxHealth*0.005 + (x.plasma_max + x.plasma_stored)*0.0005)*0.5)
			else if(isHumanSynthStrict(A))
				if(!(L.status_flags & PERMANENTLY_DEAD)) return
				PTG += 50
				to_chat(user, SPAN_DANGER("Damage analyze of corpse brought [PTG] points."))
			bioscanned += A
			SP += PTG
			to_chat(user, SPAN_WARNING("[A] scanned. As last scan brought [PTG], scanner posses now [SP] points."))

/obj/item/device/bioanalyzer/afterattack(obj/O, mob/user as mob, proximity)
	if(istype(O,/obj/structure/machinery/cm_vending/own_points/rnd_vendor))
		var/obj/structure/machinery/cm_vending/own_points/rnd_vendor/V = O
		to_chat(user, SPAN_WARNING("Swiping scanner by another scanner..."))
		if(SP > 0)
			V.available_points = V.available_points + SP
			V.available_points_to_display = V.available_points
			to_chat(user, SPAN_NOTICE("You loaded [SP]. Currently, points-balance is [V.available_points]"))
			SP = 0
		else if(SP <= 0 && V.available_points > 0)
			SP += V.available_points
			V.available_points = 0
			to_chat(user, SPAN_NOTICE("You cleared points-balance of [V]. Now, scanners posses [SP] points."))
		src.add_fingerprint(user)
	else if(istype(O,/obj/effect/alien/resin/special/))
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
			var/PTG = 0
			for(var/i in bioscanned)
				if(O == i)
					to_chat(user, SPAN_WARNING("[O] already scanned!"))
					return
			if(istype(O,/obj/effect/alien/resin/special/pylon/core))
				PTG += 200
			else if(istype(O,/obj/effect/alien/resin/special/pool))
				var/obj/effect/alien/resin/special/pool/P = O
				PTG += 50 + 30*P.linked_hive.stored_larva
				to_chat(user, SPAN_DANGER("While you were analyzing [P] with [src], [P.linked_hive.stored_larva >= 1 ? "you caught a glimpse of [P.linked_hive.stored_larva] worms!" : "it was weirdly silent."]"))
			else if(istype(O,/obj/effect/alien/resin/special/pylon)) PTG += 30
			else PTG += 100
			bioscanned += O
			SP += PTG
			to_chat(user, SPAN_WARNING("[O] scanned. As last scan brought [PTG], scanner posses now [SP] points."))
	return

/obj/item/device/bioscan
	name = "Signal scanner (WARNING)"
	desc = "Special sturdy-case that on activation triggers bioscan of unknown lifeforms. WARNING! It also reveals location where it activated!"
	icon_state = "forensic0"
	item_state = "analyzer"
	w_class = SIZE_SMALL
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 50,"glass" = 50)
	var/used = 0

/obj/item/device/bioscan/attack_self(mob/user)
	..()
	if(used == 0)
		to_chat(user, SPAN_DANGER("[src] starts to make a noise!"))
		icon_state = "+scanning"

		for(var/i in GLOB.living_xeno_list)
			var/mob/M = i
			M << sound(get_sfx("queen"), wait = 0, volume = 50)
			to_chat(M, SPAN_XENOANNOUNCE("The Queen Mother reaches into your mind from worlds away."))
			to_chat(M, SPAN_XENOANNOUNCE("To my children and their Queen. I sense strong signal reaches this planet from [get_area_name(src)]. It may be better if you hurry up and move to another location!"))

		spawn(60)
			marine_bioscan()
			to_chat(user, SPAN_NOTICE("[src] with a slight hum shuts down!"))
			icon_state = "+prints"
			used = 1
	else to_chat(user, SPAN_DANGER("[src] is already used, right now it is trash!"))

/obj/item/device/bioscan/proc/marine_bioscan(var/delta = 2)
	var/numXenosPlanet	= 0
	var/numXenosShipAres = 0 //ARES scan doesn't count containment xenos
	var/list/xenosPlanetLocations = list()
	var/list/xenosShipLocations = list()

	var/larva = 0
	var/datum/hive_status/HS
	for(var/hivenumber in GLOB.hive_datum)
		HS = GLOB.hive_datum[hivenumber]
		larva += HS.stored_larva

	for(var/mob/M in GLOB.living_xeno_list)
		var/atom/where = M
		if (where == 0 && M.loc)
			where = M.loc
		if(where.z in SSmapping.levels_by_any_trait(list(ZTRAIT_GROUND, ZTRAIT_LOWORBIT)))
			numXenosPlanet++
			xenosPlanetLocations+=where
		else if(is_mainship_level(where.z))
			numXenosShipAres++
			xenosShipLocations+=where

	var/RandomXenosPlanetLocation = ""
	if (xenosPlanetLocations.len>0)
		RandomXenosPlanetLocation = get_area_name(pick(xenosPlanetLocations))
	var/RandomXenosShipLocation = ""
	if (xenosShipLocations.len>0)
		RandomXenosShipLocation = get_area_name(pick(xenosShipLocations))
	numXenosPlanet = max(0, numXenosPlanet + rand(-delta, delta))

	var/name = "[MAIN_AI_SYSTEM] Bioscan Status"
	var/input = "Bioscan complete.\n\nSensors indicate [numXenosShipAres ? "[numXenosShipAres]":"no"] unknown lifeform signature[!numXenosShipAres || numXenosShipAres > 1 ? "s":""] present on the ship[numXenosShipAres&&RandomXenosShipLocation?", including one in [RandomXenosShipLocation],":""] and [numXenosPlanet ? "approximately [numXenosPlanet]":"no"] signature[!numXenosPlanet || numXenosPlanet > 1 ? "s":""] located elsewhere[numXenosPlanet&&RandomXenosPlanetLocation?", including one in [RandomXenosPlanetLocation]":""]."
	marine_announcement(input, name, 'sound/AI/bioscan.ogg')
