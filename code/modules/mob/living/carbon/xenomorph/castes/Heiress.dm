/datum/caste_datum/heiress
	caste_type = XENO_CASTE_HEIRESS
	tier = 0

	melee_damage_lower = XENO_DAMAGE_TIER_3
	melee_damage_upper = XENO_DAMAGE_TIER_5
	max_health = XENO_HEALTH_TIER_12
	plasma_gain = XENO_PLASMA_GAIN_TIER_7
	plasma_max = XENO_PLASMA_TIER_7
	crystal_max = XENO_CRYSTAL_MEDIUM
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_8
	armor_deflection = XENO_ARMOR_TIER_2
	evasion = XENO_EVASION_NONE
	speed = XENO_SPEED_TIER_3 //human in light armor off weeds

	build_time_mult = BUILD_TIME_MULT_BUILDER

	is_intelligent = 1
	evolution_allowed = TRUE
	evolves_to = list(XENO_CASTE_QUEEN)
	fire_intensity_resistance = BURN_LEVEL_TIER_3 //-20. Pyro's blue is 40
	caste_desc = "Yet dexterous, looming disaster. Agile, fragile, dangerous."
	spit_types = list(/datum/ammo/xeno/sticky)
	can_hold_facehuggers = 1
	can_hold_eggs = CAN_HOLD_ONE_HAND
	acid_level = 2
	weed_level = WEED_LEVEL_STANDARD
	can_be_revived = FALSE

	heal_resting = 1.2 //+20% regen

	spit_delay = 15 //Only sticky, so it is good

	tackle_min = 2
	tackle_max = 5
	tackle_chance = 45

	aura_strength = 2.5 //Weaker prae, better hivey
	tacklestrength_min = 4
	tacklestrength_max = 5

	minimum_xeno_playtime = 9 HOURS

/mob/living/carbon/Xenomorph/Heiress
	caste_type = XENO_CASTE_HEIRESS
	name = XENO_CASTE_HEIRESS
	desc = "Yet dexterous, looming disaster. Agile, fragile, dangerous in time."
	icon_size = 64
	icon_state = "Heiress Walking"
	plasma_types = list(PLASMA_CHITIN,PLASMA_PHEROMONE,PLASMA_NEUROTOXIN)
	attacktext = "bites"
	attack_sound = null
	friendly = "nuzzles"
	wall_smash = 0
	amount_grown = 0
	max_grown = 10
	pixel_x = -16
	old_x = -16
	mob_size = MOB_SIZE_XENO
	drag_delay = 4 //pulling a big dead xeno is hard
	tier = 0 //Heiress doesn't count towards population limit.
	hive_pos = XENO_QUEEN
	crystal_max = XENO_CRYSTAL_MEDIUM
	crystal_stored = XENO_CRYSTAL_MEDIUM
	small_explosives_stun = FALSE
	pull_speed = 4.5

	icon_xenonid = 'icons/mob/xenonids/queen.dmi' //I don't wanna draw that too, as backup - normal

	tileoffset = 0
	viewsize = 12

	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/onclick/regurgitate,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/place_construction,
		/datum/action/xeno_action/activable/corrosive_acid,
		/datum/action/xeno_action/onclick/emit_pheromones,
		/datum/action/xeno_action/onclick/psychic_whisper,
		/datum/action/xeno_action/activable/fling/heiress, //first macro
		/datum/action/xeno_action/activable/pounce/heiress_dash, //second macro
		/datum/action/xeno_action/onclick/tail_dispel, //third macro
		/datum/action/xeno_action/onclick/plant_weeds/heiress, //fourth macro
		/datum/action/xeno_action/onclick/choose_resin,
		/datum/action/xeno_action/activable/secrete_resin,
		/datum/action/xeno_action/activable/xeno_spit, //Macro it yourself
		/datum/action/xeno_action/onclick/create_egg
	)

	inherent_verbs = list(
		/mob/living/carbon/Xenomorph/proc/claw_toggle,
		/mob/living/carbon/Xenomorph/proc/construction_toggle,
		/mob/living/carbon/Xenomorph/proc/destruction_toggle,
		/mob/living/carbon/Xenomorph/proc/toggle_unnesting,
		/mob/living/carbon/Xenomorph/proc/rename_tunnel
	)

	mutation_type = HEIRESS_NORMAL
	claw_type = CLAW_TYPE_VERY_SHARP

/mob/living/carbon/Xenomorph/Heiress/can_destroy_special()
	return TRUE

/mob/living/carbon/Xenomorph/Heiress/Initialize(mapload, mob/living/carbon/Xenomorph/oldXeno, h_number)
	icon_xeno = get_icon_from_source(CONFIG_GET(string/alien_heiress))
	. = ..()

	if(!is_admin_level(z))//so admins can safely spawn Heiress in Thunderdome for tests.
		xeno_message(SPAN_XENOANNOUNCE("A new Heiress has risen to lead the Hive! Rejoice!"),3,hivenumber)
	playsound(loc, 'sound/voice/alien_queen_command.ogg', 75, 0)
	resin_build_order = GLOB.resin_build_order_drone

/mob/living/carbon/Xenomorph/Heiress/generate_name()
	. = ..()

	var/datum/hive_status/in_hive = hive
	if(!in_hive)
		in_hive = GLOB.hive_datum[hivenumber]

	var/name_prefix = in_hive.prefix
	switch(age)
		if(XENO_NORMAL) name = "[name_prefix]Heiress"			 //Young
		if(XENO_MATURE) name = "[name_prefix]Elder Heiress"	 //Mature
		if(XENO_ELDER) name = "[name_prefix]Elder Princess"	 //Elite
		if(XENO_ANCIENT) name = "[name_prefix]Ancient Princess" //Ancient
		if(XENO_PRIME) name = "[name_prefix]Prime Princess" //Primordial

/mob/living/carbon/Xenomorph/Heiress/gib(var/cause = "gibbing") //No gib
	death(cause, 1)

/mob/living/carbon/Xenomorph/Heiress/death(var/cause, var/gibbed)
	if(hive.living_xeno_queen == src)
		hive.xeno_queen_timer = world.time + (5 MINUTES)
	return ..()

/mob/living/carbon/Xenomorph/Heiress/Destroy()
	if(observed_xeno)
		overwatch(observed_xeno, TRUE)
	if(hive && hive.living_xeno_queen == src)
		hive.set_living_xeno_queen(null)
	return ..()

/datum/action/xeno_action/activable/fling/heiress
	name = "Push"
	ability_name = "Fling"
	macro_path = /datum/action/xeno_action/verb/verb_fling
	ability_primacy = XENO_PRIMARY_ACTION_1
	xeno_cooldown = 75

	// Configurables
	fling_distance = 3
	stun_power = 1
	weaken_power = 1

//Re-macroed weeds
/datum/action/xeno_action/onclick/plant_weeds/heiress
	ability_primacy = XENO_PRIMARY_ACTION_4

// Queen Tail dispel
/datum/action/xeno_action/onclick/tail_dispel
	name = "Tail Dispel"
	action_icon_state = "tail_sweep"
	ability_name = "tail sweep"
	macro_path = /datum/action/xeno_action/verb/verb_tail_dispel
	action_type = XENO_ACTION_ACTIVATE
	ability_primacy = XENO_PRIMARY_ACTION_3
	plasma_cost = 200
	xeno_cooldown = 200

/datum/action/xeno_action/verb/verb_tail_dispel()
	set category = "Alien"
	set name = "Tail Dispel"
	set hidden = 1
	var/action_name = "Tail dispel"
	handle_xeno_macro(src, action_name)

/datum/action/xeno_action/onclick/tail_dispel/use_ability(atom/A) //Modified defender's sweep
	var/mob/living/carbon/Xenomorph/X = owner
	if (!istype(X))
		return
	if(!X.check_state())
		return
	if (!action_cooldown_check())
		return

	X.visible_message(SPAN_XENOWARNING("[X] sweeps its tail around in a very wide circle!"), \
	SPAN_XENOWARNING("You sweep your tail around in a wide circle!"))

	if(!check_and_use_plasma_owner())
		return

	X.spin_circle()
	X.emote("tail")

	var/sweep_range = 1
	for(var/mob/living/carbon/H in orange(sweep_range, get_turf(X)))

		if (!isXenoOrHuman(H) || X.can_not_harm(H)) continue
		if(H.stat == DEAD) continue
		if(HAS_TRAIT(H, TRAIT_NESTED)) continue
		step_away(H, X, sweep_range, 2)
		H.last_damage_data = create_cause_data(X.caste_type, X)
		H.apply_armoured_damage(get_xeno_damage_slash(H, 15), ARMOR_MELEE, BRUTE)
		shake_camera(H, 3, 1)

		if(H.mob_size < MOB_SIZE_BIG)
			H.KnockDown(get_xeno_stun_duration(H, 2), 1)

		to_chat(H, SPAN_XENOWARNING("You are struck by [src]'s tail sweep!"))
		playsound(H,'sound/weapons/alien_claw_block.ogg', 50, 1)

	apply_cooldown()
	..()
	return

//Create egg
/datum/action/xeno_action/onclick/create_egg
	name = "Create Egg (400)"
	action_icon_state = "lay_egg"
	ability_name = "create egg"
	macro_path = /datum/action/xeno_action/verb/verb_create_egg
	xeno_cooldown = 30 SECONDS
	cooldown_message = "You are ready to form another egg."
	//action_type = XENO_ACTION_ACTIVATE
	plasma_cost = XENO_PLASMA_TIER_4

/datum/action/xeno_action/verb/verb_create_egg()
	set category = "Alien"
	set name = "Create Egg"
	set hidden = 1
	var/action_name = "create egg"
	handle_xeno_macro(src, action_name)

/datum/action/xeno_action/onclick/create_egg/can_use_action()
	if(!owner)
		return FALSE
	var/mob/living/carbon/Xenomorph/X = owner
	if(X && !X.is_mob_incapacitated() && !X.dazed && !X.lying && !X.buckled && X.plasma_stored >= plasma_cost)
		return TRUE

/datum/action/xeno_action/onclick/create_egg/use_ability()
	var/mob/living/carbon/Xenomorph/X = owner
	if(!istype(X))
		return FALSE
	if(!do_after(X, 10, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
		return
	to_chat(X, SPAN_NOTICE("You form a new egg."))

	new /obj/item/xeno_egg(X.loc, X.hivenumber)
	playsound(X.loc, 'sound/effects/splat.ogg', 15, 1)

	X.use_plasma(plasma_cost)
	apply_cooldown()
	return TRUE

//Heiress' dash
/datum/action/xeno_action/activable/pounce/heiress_dash
	name = "Dash"
	action_icon_state = "prae_dash"
	ability_name = "dash"
	macro_path = /datum/action/xeno_action/verb/verb_dash
	action_type = XENO_ACTION_CLICK
	ability_primacy = XENO_PRIMARY_ACTION_2
	xeno_cooldown = 110
	plasma_cost = 50

	// Config options
	distance = 2
	knockdown = FALSE
	slash = FALSE
	freeze_self = FALSE

	var/buff_duration = 12
	var/damage = 40
	var/shield_regen_threshold = 2

	var/activated_once = FALSE
	var/time_until_timeout = 40

/datum/action/xeno_action/activable/pounce/heiress_dash/initialize_pounce_pass_flags()
	pounce_pass_flags = PASS_MOB_THRU|PASS_OVER_THROW_MOB

/datum/action/xeno_action/activable/pounce/heiress_dash/use_ability(atom/A)
	if(!activated_once && !action_cooldown_check() || owner.throwing)
		return

	. = ..()
	if(activated_once) //Reused
		apply_cooldown() //Force to cooldown
		activated_once = FALSE
	else if(. && !activated_once) //Once used, reuse available
		activated_once = TRUE
		addtimer(CALLBACK(src, .proc/timeout), time_until_timeout)
		end_cooldown() //So we can reuse it

/datum/action/xeno_action/activable/pounce/heiress_dash/proc/timeout()
	if (activated_once) //Else it is just an end
		activated_once = FALSE
		apply_cooldown() //Wasn't reused, need to go cooldown
