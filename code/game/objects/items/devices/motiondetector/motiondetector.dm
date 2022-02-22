/obj/item/device/motion_radar //Thanks to CarrotMan
	name = "motion radar"
	icon = 'icons/obj/items/motiondetector.dmi'
	icon_state = "off"
	flags_atom = CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = 2.0
	item_state = "electronic"
	throw_speed = 4
	throw_range = 14
	var/active = 0
	var/detector_ping = 1
	var/obj/detector_image = new()
	var/datum/shape/rectangle/range_bounds
	var/detector_range = 14
	var/iff_signal = FACTION_MARINE

mob/var/tracker_position = null
mob/var/current_detector = null

/obj/item/device/motion_radar/examine()
	. = ..()
	var/msg = "Blue bubble-like indicators on your radar will show pings locations and direction to them. The device screen will show unidentified movements detected. Has [SPAN_HELPFUL("[detector_range] tiles range")]. Use [SPAN_HELPFUL("Alt + Click")] on the device to enable or disable sound-pings."
	to_chat(usr, SPAN_INFO(msg))

/obj/item/device/motion_radar/New()
	range_bounds = new //Just creating a rectangle datum
	..()

/obj/item/device/motion_radar/attack_self(mob/user as mob)
	. = ..()
	CreateDetectorImage(user, 'icons/obj/items/detectorscreen.dmi')
	ToggleDetector(user)

/obj/item/device/motion_radar/clicked(mob/user, list/mods)
	if (isobserver(user) || isXeno(user)) return
	if (mods["alt"])
		detector_ping = !detector_ping
		return 1
	return ..()

/obj/item/device/motion_radar/proc/CreateDetectorImage(mob/user, image) //Creates the animated detector background
	if(detector_image in user.client.screen)
		return
	else
		detector_image.icon = image
		detector_image.screen_loc = "detector:1,1"
		user.client.screen += detector_image
	return

/obj/item/device/motion_radar/proc/Redraw(mob/user)
	while(active && user.client)
		var/mob/M = user
		var/list/detected = list()

		for(var/obj/Blip/o in user.client.screen)
			user.client.screen -= o //Remove all blips from the tracker, then..
			qdel(o)	//Store all removed blips in the pool

		var/turf/cur_turf = get_turf(src)
		if(!istype(cur_turf))
			return
		if(!range_bounds)
			range_bounds = new/datum/shape/rectangle
		range_bounds.center_x = cur_turf.x
		range_bounds.center_y = cur_turf.y
		range_bounds.width = detector_range * 2
		range_bounds.height = detector_range * 2

		var/list/ping_candidates = SSquadtree.players_in_range(range_bounds, cur_turf.z, QTREE_EXCLUDE_OBSERVER | QTREE_SCAN_MOBS)

		sleep(3) //Amount of time to "check" for movement
		for(var/mob/living/t in ping_candidates)
			if(t != M)
				if(t.get_target_lock(iff_signal))
					continue
				t.tracker_position = t.loc
			if((t.tracker_position != null) && (get_dist(t.tracker_position, t.loc) >= 1))
				spawn(3) t.tracker_position = null
				detected += t
		for(var/obj/structure/machinery/door/airlock/D in range(14,M))
			if(D.operating)
				detected += D
		for(var/obj/structure/mineral_door/D in range(14,M))
			if(D.isSwitchingStates)
				detected += D
		for(var/obj/item/clothing/mask/facehugger/F in range(14,M))
			if(!F.stat)
				detected += F
		for(var/mob/hologram/queen/Q in GLOB.hologram_list)
			if(Q.z != cur_turf.z || !(range_bounds.contains_atom(Q))) continue
			detected += Q

		if(detected.len>=1)
			var/dist = 100 // this used below, to get sound tone for pinging.

			for(var/atom/movable/t in detected)
				if(get_dist(t, M) < dist)
					dist = get_dist(t, M)
				var/obj/Blip/o = PoolOrNew(/obj/Blip) // Get a blip from the blip pool
				o.pixel_x = (t.x-M.x)*4-4 // Make the blip in the right position on the radar (multiplied by the icon dimensions)
				o.pixel_y = (t.y-M.y)*4-6 //-2 is a slight offset south and west
				o.screen_loc = "detector:3:[o.pixel_x],3:[o.pixel_y]" // Make it appear on the radar map
				user.client.screen += o // Add it to the radar
				flick("blip", o)
			detected = null
			if(detector_ping)
				playsound(src.loc, 'sound/items/newtick.ogg', 25) //If player isn't the only blip, play ping
		playsound(src.loc, 'sound/items/scan.ogg', 15)
		flick("", detector_image)
		sleep(10)
	active = 0
	icon_state = "off"
	user.current_detector = null
	winshow(user, "detectorwindow", 0)

/obj/item/device/motion_radar/proc/ToggleDetector(mob/user)
	if(winget(user,"detectorwindow","is-visible")=="true" && user.current_detector == src) //Checks if radar window is already open and if radar is assigned
		active = 0 //Sets the active state of the radar to off
		icon_state = "off"
		user << "\red You deactivate the radar."
		winshow(user, "detectorwindow", 0) //Closes the radar window
		playsound(null) //Stops the radar pings
		playsound(src.loc, 'sound/items/detector_off.ogg', 15)
		user.current_detector = null
	else if(!user.current_detector)
		active = 1
		icon_state = "on"
		user << "\blue You activate the radar."
		playsound(src.loc, 'sound/items/detector_on.ogg', 15)
		winshow(user, "detectorwindow", 1)
		user.current_detector = src
		Redraw(user)
	else user << "\red You're already using another tracker."

/obj/item/device/motion_radar/verb/Toggle_Ping_Sound()
	set name = "Toggle Ping Sound"
	set category = "Object"
	detector_ping = !detector_ping

/obj/item/device/motion_radar/dropped(mob/user)
	. = ..()
	if(active && isturf(loc))
		ToggleDetector(user) //Disables the radar if dropped
		icon_state = "off"

/obj/item/device/motion_radar/pickup(mob/user)
	. = ..()
	if(active && user.current_detector == src) //If the radar on the floor is active and tied to the user
		winshow(user, "detectorwindow", 1)

obj/Blip
	icon = 'icons/obj/items/detector-blips.dmi'
	icon_state = "blip"
	layer = 5
