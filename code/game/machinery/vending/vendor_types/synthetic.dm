//------------GEAR VENDOR---------------

/obj/structure/machinery/cm_vending/gear/synth
	name = "\improper ColMarTech Auxiliary Gear Rack"
	desc = "An automated gear rack hooked up to a colossal storage of various medical and engineering supplies. Can be accessed only by synthetic units."
	icon_state = "gear"
	req_access = list(ACCESS_MARINE_COMMANDER)
	vendor_role = list(JOB_SYNTH, JOB_SYNTH_SURVIVOR)

	listed_products = list(
		list("ENGINEER SUPPLIES", 0, null, null, null),
		list("Airlock Circuit Board", 2, /obj/item/circuitboard/airlock, null, VENDOR_ITEM_REGULAR),
		list("APC Circuit Board", 2, /obj/item/circuitboard/apc, null, VENDOR_ITEM_REGULAR),
		list("Entrenching Tool", 2, /obj/item/tool/shovel/etool, null, VENDOR_ITEM_REGULAR),
		list("High-Capacity Power Cell", 3, /obj/item/cell/high, null, VENDOR_ITEM_REGULAR),
		list("Light Replacer", 2, /obj/item/device/lightreplacer, null, VENDOR_ITEM_REGULAR),
		list("Metal x10", 5, /obj/item/stack/sheet/metal/small_stack, null, VENDOR_ITEM_REGULAR),
		list("Multitool", 4, /obj/item/device/multitool, null, VENDOR_ITEM_REGULAR),
		list("Plasteel x10", 7, /obj/item/stack/sheet/plasteel/small_stack, null, VENDOR_ITEM_RECOMMENDED),
		list("Sandbags x25", 10, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_REGULAR),
		list("Industrial Blowtorch", 4, /obj/item/tool/weldingtool/largetank, null, VENDOR_ITEM_RECOMMENDED),

		list("MEDICAL SUPPLIES", 0, null, null, null),
		list("Adv Burn Kit", 2, /obj/item/stack/medical/advanced/ointment, null, VENDOR_ITEM_REGULAR),
		list("Adv Trauma Kit", 2, /obj/item/stack/medical/advanced/bruise_pack, null, VENDOR_ITEM_REGULAR),
		list("Advanced Firstaid Kit", 12, /obj/item/storage/firstaid/adv, null, VENDOR_ITEM_REGULAR),
		list("Firstaid Kit", 6, /obj/item/storage/firstaid/regular, null, VENDOR_ITEM_REGULAR),
		list("Medevac Bed", 6, /obj/item/roller/medevac, null, VENDOR_ITEM_REGULAR),
		list("Medical Splints", 1, /obj/item/stack/medical/splint, null, VENDOR_ITEM_REGULAR),
		list("Roller Bed", 4, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("Stasis Bag", 6, /obj/item/bodybag/cryobag, null, VENDOR_ITEM_REGULAR),
		list("Surgical Line", 4, /obj/item/tool/surgery/surgical_line, null, VENDOR_ITEM_REGULAR),

		list("Pillbottle (Bicaridine)", 5, /obj/item/storage/pill_bottle/bicaridine, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Dexalin)", 5, /obj/item/storage/pill_bottle/dexalin, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Dylovene)", 5, /obj/item/storage/pill_bottle/antitox, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Inaprovaline)", 5, /obj/item/storage/pill_bottle/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Kelotane)", 5, /obj/item/storage/pill_bottle/kelotane, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Peridaxon)", 5, /obj/item/storage/pill_bottle/peridaxon, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (QuickClot)", 5, /obj/item/storage/pill_bottle/quickclot, null, VENDOR_ITEM_REGULAR),
		list("Pillbottle (Tramadol)", 5, /obj/item/storage/pill_bottle/tramadol, null, VENDOR_ITEM_REGULAR),

		list("Injector (Bicaridine)", 1, /obj/item/reagent_container/hypospray/autoinjector/bicaridine, null, VENDOR_ITEM_REGULAR),
		list("Injector (Dexalin+)", 1, /obj/item/reagent_container/hypospray/autoinjector/dexalinp, null, VENDOR_ITEM_REGULAR),
		list("Injector (Epinephrine)", 2, /obj/item/reagent_container/hypospray/autoinjector/adrenaline, null, VENDOR_ITEM_REGULAR),
		list("Injector (Inaprovaline)", 1, /obj/item/reagent_container/hypospray/autoinjector/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Injector (Kelotane)", 1, /obj/item/reagent_container/hypospray/autoinjector/kelotane, null, VENDOR_ITEM_REGULAR),
		list("Injector (Oxycodone)", 2, /obj/item/reagent_container/hypospray/autoinjector/oxycodone, null, VENDOR_ITEM_REGULAR),
		list("Injector (QuickClot)", 1, /obj/item/reagent_container/hypospray/autoinjector/quickclot, null, VENDOR_ITEM_REGULAR),
		list("Injector (Tramadol)", 1, /obj/item/reagent_container/hypospray/autoinjector/tramadol, null, VENDOR_ITEM_REGULAR),
		list("Injector (Tricord)", 1, /obj/item/reagent_container/hypospray/autoinjector/tricord, null, VENDOR_ITEM_REGULAR),

		list("Emergency Defibrillator", 4, /obj/item/device/defibrillator, null, VENDOR_ITEM_MANDATORY),
		list("Health Analyzer", 4, /obj/item/device/healthanalyzer, null, VENDOR_ITEM_REGULAR),

		list("OTHER SUPPLIES", 0, null, null, null),
		list("Binoculars", 5,/obj/item/device/binoculars, null, VENDOR_ITEM_RECOMMENDED),
		list("Flashlight", 1, /obj/item/device/flashlight, null, VENDOR_ITEM_REGULAR),
		list("Fulton Recovery Device", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 5, /obj/item/device/motiondetector, null, VENDOR_ITEM_RECOMMENDED),
		list("Incision Management System", 35, /obj/item/tool/surgery/scalpel/manager, null, VENDOR_ITEM_RECOMMENDED),
		list("Space Cleaner", 2, /obj/item/reagent_container/spray/cleaner, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

	)

//------------CLOTHING VENDOR---------------

GLOBAL_LIST_INIT(cm_vending_clothing_synth, list(
		list("EXPERIMENTAL TOOL TOKEN (TAKE ALL)", 0, null, null, null),
		list("Experimental Tool Vendor Token", 0, /obj/item/coin/marine/synth, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),

		list("RADIO (TAKE ALL)", 0, null, null, null),
		list("Headset", 0, /obj/item/device/radio/headset/almayer/mcom/cdrcom, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),

		list("UNIFORM (CHOOSE 1)", 0, null, null, null),
		list("Medical Scrubs, Green", 0, /obj/item/clothing/under/rank/medical/green, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Uniform, Outdated Synth", 0, /obj/item/clothing/under/rank/synthetic/old, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Uniform, Standard Synth", 0, /obj/item/clothing/under/rank/synthetic, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("USCM Standard Uniform", 0, /obj/item/clothing/under/marine, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Working Joe Uniform", 0, /obj/item/clothing/under/rank/synthetic/joe, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),

		list("WEBBING (CHOOSE 1)", 0, null, null, null),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Surgical Webbing Vest", 0, /obj/item/clothing/accessory/storage/surg_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("SHOES (CHOOSE 1)", 0, null, null, null),
		list("Boots", 0, /obj/item/clothing/shoes/marine/knife, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),
		list("Shoes, White", 0, /obj/item/clothing/shoes/white, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (CHOOSE 1)", 0, null, null, null),
		list("Expedition Cap", 0, /obj/item/clothing/head/cmcap/flap, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Hard Hat, Orange", 0, /obj/item/clothing/head/hardhat/orange, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Surgical Cap, Green", 0, /obj/item/clothing/head/surgery/green, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Welding Helmet", 0, /obj/item/clothing/head/welding, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("SUIT (CHOOSE 1)", 0, null, null, null),
		list("M3A1 Pattern Synthetic Utility Vest (UA Gray)", 0, /obj/item/clothing/suit/storage/marine/light/synvest/vanilla, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("M3A1 Pattern Synthetic Utility Vest (Mission-Specific Camo)", 0, /obj/item/clothing/suit/storage/marine/light/synvest, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("GLOVES (CHOOSE 1)", 0, null, null, null),
		list("Insulated Gloves", 0, /obj/item/clothing/gloves/yellow, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Black Gloves", 0, /obj/item/clothing/gloves/black, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Latex Gloves", 0, /obj/item/clothing/gloves/latex, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Smartpack, Blue", 0, /obj/item/storage/backpack/marine/smartpack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Smartpack, Green", 0, /obj/item/storage/backpack/marine/smartpack/green, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Smartpack, Tan", 0, /obj/item/storage/backpack/marine/smartpack/tan, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Smartpack, White", 0, /obj/item/storage/backpack/marine/smartpack/white, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Smartpack, Black", 0, /obj/item/storage/backpack/marine/smartpack/black, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("G8-A General Utility Pouch", 0, /obj/item/storage/sparepouch, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Lifesaver Bag", 0, /obj/item/storage/belt/medical/lifesaver/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Medical Storage Belt", 0, /obj/item/storage/belt/medical/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Toolbelt Rig (Full)", 0, /obj/item/storage/belt/utility/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Autoinjector Pouch", 0, /obj/item/storage/pouch/autoinjector, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Construction Pouch", 0, /obj/item/storage/pouch/construction, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Electronics Pouch (Full)", 0, /obj/item/storage/pouch/electronics/full, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 0, /obj/item/storage/pouch/firstaid/full/alternate, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 0, /obj/item/storage/pouch/general/large, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Medical Pouch", 0, /obj/item/storage/pouch/medical, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Medkit Pouch", 0, /obj/item/storage/pouch/medkit, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),
		list("Tools Pouch (Full)", 0, /obj/item/storage/pouch/tools/full, (MARINE_CAN_BUY_R_POUCH|MARINE_CAN_BUY_L_POUCH), VENDOR_ITEM_REGULAR),

		list("MASK", 0, null, null, null),
		list("Sterile mask", 0, /obj/item/clothing/mask/surgical, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR)
	))

/obj/structure/machinery/cm_vending/clothing/synth
	name = "\improper ColMarTech Synthetic Equipment Rack"
	desc = "An automated rack hooked up to a colossal storage of various equipment. Can be accessed only by synthetic units."
	req_access = list(ACCESS_MARINE_COMMANDER)
	vendor_role = list(JOB_SYNTH, JOB_SYNTH_SURVIVOR)

/obj/structure/machinery/cm_vending/clothing/synth/Initialize(mapload, ...)
	. = ..()
	listed_products = GLOB.cm_vending_clothing_synth

//------------SNOWFLAKE VENDOR---------------

/obj/structure/machinery/cm_vending/clothing/synth/snowflake
	name = "\improper Snowflake Vendor"
	desc = "A vendor with a large snowflake on it. Provided by Wey-Yu Fashion Division(TM)."
	icon_state = "snowflake"
	use_points = TRUE
	show_points = TRUE
	use_snowflake_points = TRUE
	vendor_theme = VENDOR_THEME_COMPANY
	req_access = list(ACCESS_MARINE_COMMANDER)
	vendor_role = list(JOB_SYNTH, JOB_SYNTH_SURVIVOR)

	vend_delay = 10

/obj/structure/machinery/cm_vending/clothing/synth/snowflake/Initialize(mapload, ...)
	. = ..()
	listed_products = list(
		list("UNIFORM", 0, null, null, null),
		list("Medical Scrubs, Blue", 12, /obj/item/clothing/under/rank/medical/blue, null, VENDOR_ITEM_REGULAR),
		list("Medical Scrubs, Green", 12, /obj/item/clothing/under/rank/medical/green, null, VENDOR_ITEM_REGULAR),
		list("Medical Scrubs, Purple", 12, /obj/item/clothing/under/rank/medical/purple, null, VENDOR_ITEM_REGULAR),
		list("Medical Scrubs, White", 12, /obj/item/clothing/under/rank/medical, null, VENDOR_ITEM_REGULAR),
		list("USCM Service Uniform", 12, /obj/item/clothing/under/marine/officer/bridge, null, VENDOR_ITEM_REGULAR),
		list("Engineer Uniform", 12, /obj/item/clothing/under/marine/officer/engi, null, VENDOR_ITEM_REGULAR),
		list("White T-Shirt and Brown Jeans", 12, /obj/item/clothing/under/tshirt/w_br, null, VENDOR_ITEM_REGULAR),
		list("Gray T-Shirt and Blue Jeans", 12, /obj/item/clothing/under/tshirt/gray_blu, null, VENDOR_ITEM_REGULAR),
		list("Red T-Shirt and Black Jeans", 12, /obj/item/clothing/under/tshirt/r_bla, null, VENDOR_ITEM_REGULAR),
		list("Gray Utilities", 12, /obj/item/clothing/under/colonist/ua_civvies, null, VENDOR_ITEM_REGULAR),
		list("Brown Utilities", 12, /obj/item/clothing/under/colonist/wy_davisone, null, VENDOR_ITEM_REGULAR),
		list("Stewart Utilities", 12, /obj/item/clothing/under/colonist/wy_joliet_shopsteward, null, VENDOR_ITEM_REGULAR),

		list("GLASSES", 0, null, null, null),
		list("HealthMate HUD", 12, /obj/item/clothing/glasses/hud/health, null, VENDOR_ITEM_REGULAR),
		list("Marine RPG Glasses", 12, /obj/item/clothing/glasses/regular, null, VENDOR_ITEM_REGULAR),
		list("Optical Meson Scanner", 12, /obj/item/clothing/glasses/meson, null, VENDOR_ITEM_REGULAR),
		list("PatrolMate HUD", 12, /obj/item/clothing/glasses/hud/security, null, VENDOR_ITEM_REGULAR),
		list("Sunglasses", 12, /obj/item/clothing/glasses/sunglasses, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 12, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),

		list("SHOES", 0, null, null, null),
		list("Boots", 12, /obj/item/clothing/shoes/marine, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Black", 12, /obj/item/clothing/shoes/black, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Blue", 12, /obj/item/clothing/shoes/blue, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Brown", 12, /obj/item/clothing/shoes/brown, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Green", 12, /obj/item/clothing/shoes/green, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Purple", 12, /obj/item/clothing/shoes/purple, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Red", 12, /obj/item/clothing/shoes/red, null, VENDOR_ITEM_REGULAR),
		list("Shoes, White", 12, /obj/item/clothing/shoes/white, null, VENDOR_ITEM_REGULAR),
		list("Shoes, Yellow", 12, /obj/item/clothing/shoes/yellow, null, VENDOR_ITEM_REGULAR),

		list("HELMET", 0, null, null, null),
		list("Beanie", 12, /obj/item/clothing/head/beanie, null, VENDOR_ITEM_REGULAR),
		list("Beret, Engineering", 12, /obj/item/clothing/head/beret/eng, null, VENDOR_ITEM_REGULAR),
		list("Beret, Purple", 12, /obj/item/clothing/head/beret/jan, null, VENDOR_ITEM_REGULAR),
		list("Beret, Red", 12, /obj/item/clothing/head/beret/cm/red, null, VENDOR_ITEM_REGULAR),
		list("Beret, Standard", 12, /obj/item/clothing/head/beret/cm, null, VENDOR_ITEM_REGULAR),
		list("Beret, Tan", 12, /obj/item/clothing/head/beret/cm/tan, null, VENDOR_ITEM_REGULAR),
		list("Cap", 12, /obj/item/clothing/head/cmcap, null, VENDOR_ITEM_REGULAR),
		list("Surgical Cap, Blue", 12, /obj/item/clothing/head/surgery/blue, null, VENDOR_ITEM_REGULAR),
		list("Surgical Cap, Blue", 12, /obj/item/clothing/head/surgery/purple, null, VENDOR_ITEM_REGULAR),
		list("Surgical Cap, Green", 12, /obj/item/clothing/head/surgery/green, null, VENDOR_ITEM_REGULAR),
		list("Ushanka", 12, /obj/item/clothing/head/ushanka, null, VENDOR_ITEM_REGULAR),

		list("SUIT", 0, null, null, null),
		list("Brown Bomber Jacket", 12, /obj/item/clothing/suit/storage/bomber, null, VENDOR_ITEM_REGULAR),
		list("Black Bomber Jacket", 12, /obj/item/clothing/suit/storage/bomber/alt, null, VENDOR_ITEM_REGULAR),
		list("External webbing", 12, /obj/item/clothing/suit/storage/webbing, null, VENDOR_ITEM_REGULAR),
		list("Hazard Vest", 12, /obj/item/clothing/suit/storage/hazardvest, null, VENDOR_ITEM_REGULAR),
		list("Synthetic's Snow Suit", 12, /obj/item/clothing/suit/storage/snow_suit/synth, null, VENDOR_ITEM_REGULAR),
		list("USCM Service Jacket", 12, /obj/item/clothing/suit/storage/jacket/marine/service, null, VENDOR_ITEM_REGULAR),
		list("Brown Windbreaker", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_brown, null, VENDOR_ITEM_REGULAR),
		list("Gray Windbreaker", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_gray, null, VENDOR_ITEM_REGULAR),
		list("Green Windbreaker", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_green, null, VENDOR_ITEM_REGULAR),
		list("First Responder Windbreaker", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_fr, null, VENDOR_ITEM_REGULAR),
		list("Exploration Windbreaker", 12, /obj/item/clothing/suit/storage/windbreaker/windbreaker_covenant, null, VENDOR_ITEM_REGULAR),
		list("Labcoat", 12, /obj/item/clothing/suit/storage/labcoat, null, VENDOR_ITEM_REGULAR),
		list("Labcoat, Researcher", 12, /obj/item/clothing/suit/storage/labcoat/researcher, null, VENDOR_ITEM_REGULAR),

		list("BACKPACK", 0, null, null, null),
		list("Backpack, Industrial", 12, /obj/item/storage/backpack/industrial, null, VENDOR_ITEM_REGULAR),
		list("Backpack, Medic", 12, /obj/item/storage/backpack/marine/medic, null, VENDOR_ITEM_REGULAR),
		list("Backpack, Standard", 12, /obj/item/storage/backpack/marine, null, VENDOR_ITEM_REGULAR),
		list("Backpack, Tech", 12, /obj/item/storage/backpack/marine/tech, null, VENDOR_ITEM_REGULAR),
		list("Satchel, Standard", 12, /obj/item/storage/backpack/marine/satchel, null, VENDOR_ITEM_REGULAR),
		list("Welderpack", 12, /obj/item/storage/backpack/marine/engineerpack, null, VENDOR_ITEM_REGULAR)
	)

//------------EXPERIMENTAL TOOLS---------------
/obj/structure/machinery/cm_vending/own_points/experimental_tools
	name = "\improper Experimental Tools Vendor"
	desc = "A smaller vendor hooked up to a cache of specially provisioned, experimental tools and equipment. Handle with care."
	icon_state = "robotics"
	available_points = 0
	available_points_to_display = 0
	vendor_theme = VENDOR_THEME_COMPANY
	req_access = list(ACCESS_MARINE_COMMANDER)
	vendor_role = list(JOB_SYNTH)

/obj/structure/machinery/cm_vending/own_points/experimental_tools/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/coin/marine/synth))
		if(user.drop_inv_item_to_loc(W, src))
			available_points = available_points + 45
			available_points_to_display = available_points
			to_chat(user, SPAN_NOTICE(" You insert the [W] into the [src]"))
	return ..()

/obj/structure/machinery/cm_vending/own_points/experimental_tools
	listed_products = list(
		list("Breaching Hammer", 15, /obj/item/weapon/melee/twohanded/breacher, null, VENDOR_ITEM_REGULAR),

		list("Compact Defibrillator", 15, /obj/item/device/defibrillator/compact, null, VENDOR_ITEM_REGULAR),

      	list("Compact Nailgun kit", 15, /obj/effect/essentials_set/cnailgun, null, VENDOR_ITEM_REGULAR),

		list("Crew Monitor", 15, /obj/item/tool/crew_monitor, null, VENDOR_ITEM_REGULAR),

		list("Experimental Meson Goggles", 15, /obj/item/clothing/glasses/night/experimental_mesons, null, VENDOR_ITEM_REGULAR),

		list("Telescopic Baton", 15, /obj/item/weapon/melee/telebaton, null, VENDOR_ITEM_REGULAR),
	)

//------------EXPERIMENTAL TOOL KITS---------------
/obj/effect/essentials_set/cnailgun
    spawned_gear_list = list(
        /obj/item/weapon/gun/smg/nailgun/compact,
        /obj/item/ammo_magazine/smg/nailgun,
        /obj/item/ammo_magazine/smg/nailgun,
    )



   //////////////////////////////////////////////
  //////////////////////////////////////////////
 //////////////////////////////////////////////
//////////////////////////////////////////////


//------------RND VENDOR---------------
/obj/structure/machinery/cm_vending/own_points/rnd_vendor
	name = "\improper RnD Vendor"
	desc = "A smaller vendor hooked up to a special cargo of specially provisioned, experimental tools and equipment made by Rnd. Handle with care."
	icon_state = "robotics"
	available_points = 0
	available_points_to_display = 0
	vendor_theme = VENDOR_THEME_COMPANY
	wrenchable = TRUE

/obj/structure/machinery/cm_vending/own_points/rnd_vendor
	listed_products = list(
		list("ANALYZER", 0, null, null, null),
		list("Analyzer", 0, /obj/item/device/bioanalyzer, MARINE_CAN_BUY_SCANNER, VENDOR_ITEM_MANDATORY),

		list("WEAPONS", 0, null, null, null),
		list("Breaching Hammer", 175, /obj/item/weapon/melee/twohanded/breacher, null, VENDOR_ITEM_REGULAR),
		list("Telescopic Baton", 125, /obj/item/weapon/melee/telebaton, null, VENDOR_ITEM_REGULAR),
		list("M41A/2", 250, /obj/item/weapon/gun/rifle/m41a/elite/free, null, VENDOR_ITEM_RECOMMENDED),
		list("M39/2", 250, /obj/item/weapon/gun/smg/m39/elite/free, null, VENDOR_ITEM_REGULAR),

		list("STIMULANTS", 0, null, null, null),
		list("Emergency Autoinjector", 30, /obj/item/reagent_container/hypospray/autoinjector/emergency/skillless, null, VENDOR_ITEM_REGULAR),
		list("Redemption Stimulant", 200, /obj/item/reagent_container/hypospray/autoinjector/stimulant/redemption_stimulant, null, VENDOR_ITEM_RECOMMENDED),
		list("Brain Stimulant", 150, /obj/item/reagent_container/hypospray/autoinjector/stimulant/brain_stimulant, null, VENDOR_ITEM_REGULAR),
		list("Speed Stimulant", 150, /obj/item/reagent_container/hypospray/autoinjector/stimulant/speed_stimulant, null, VENDOR_ITEM_REGULAR),

		list("MEDICAL", 0, null, null, null),
		list("Upgraded trauma Kit", 25, /obj/item/stack/medical/advanced/bruise_pack/upgraded, null, VENDOR_ITEM_REGULAR),
		list("Upgraded burn Kit", 25, /obj/item/stack/medical/advanced/ointment/upgraded, null, VENDOR_ITEM_REGULAR),
		list("Nanosplints", 50, /obj/item/stack/medical/splint/nano, null, VENDOR_ITEM_REGULAR),
		list("Upgraded Defibrillator", 50, /obj/item/device/defibrillator/upgraded, null, VENDOR_ITEM_RECOMMENDED),
		list("Incision Management System", 35, /obj/item/tool/surgery/scalpel/manager, null, VENDOR_ITEM_REGULAR),
		list("Anti-addictive dose", 40, /obj/item/reagent_container/hypospray/autoinjector/gisfulinate/skillless, null, VENDOR_ITEM_REGULAR),

		list("IMPLANTS", 0, null, null, null),
		list("Nightvision Implant", 75, /obj/item/device/implanter/nvg, null, VENDOR_ITEM_REGULAR),
		list("Rejuvenation Implant", 75, /obj/item/device/implanter/rejuv, null, VENDOR_ITEM_REGULAR),
		list("Agility Implant", 75, /obj/item/device/implanter/agility, null, VENDOR_ITEM_REGULAR),
		list("Subdermal Armor", 75, /obj/item/device/implanter/subdermal_armor, null, VENDOR_ITEM_RECOMMENDED),

		list("EQUIPMENT", 0, null, null, null),
		list("Crew Monitor", 50, /obj/item/tool/crew_monitor, null, VENDOR_ITEM_REGULAR),
		list("Bio-proofed uniform", 100, /obj/item/clothing/under/marine/rnd, null, VENDOR_ITEM_REGULAR),
		list("Resin-proofed boots", 250, /obj/item/clothing/shoes/marine/advanced, null, VENDOR_ITEM_RECOMMENDED),
		list("B13 armor", 200, /obj/item/clothing/suit/storage/marine/rnd, null, VENDOR_ITEM_RECOMMENDED),
		list("RnD Full-suit", 200, /obj/item/clothing/suit/storage/marine/rnd/coat, null, VENDOR_ITEM_REGULAR),
		list("Insulated armored Gloves", 100, /obj/item/clothing/gloves/marine/veteran/insulated, null, VENDOR_ITEM_REGULAR),
		list("M4RA Battle sight", 200, /obj/item/clothing/glasses/night/M4RA, null, VENDOR_ITEM_REGULAR),
		list("Signal scanner (WARNING)", 200, /obj/item/device/bioscan, null, VENDOR_ITEM_REGULAR),

		list("AMMUNITION", 0, null, null, null),
		list("Incendiary Buckshot Kit", 200, /obj/item/storage/box/shotgun/buckshot, null, VENDOR_ITEM_RECOMMENDED),
		list("Incendiary Slug Kit", 150, /obj/item/storage/box/shotgun/slug, null, VENDOR_ITEM_REGULAR),
		list("Incendiary Ammo Kit", 250, /obj/item/ammo_kit/incendiary, null, VENDOR_ITEM_RECOMMENDED),
		list("Cluster Ammo Kit", 150, /obj/item/ammo_kit/cluster, null, VENDOR_ITEM_REGULAR),
		list("Toxin Ammo Kit", 150, /obj/item/ammo_kit/toxin, null, VENDOR_ITEM_REGULAR),
		list("Wall-Piercing Ammo Kit", 350, /obj/item/ammo_kit/penetrating, null, VENDOR_ITEM_REGULAR),

		list("INSTRUCTIONAL PAMPHLETS", 0, null, null, null),
		list("Medic", 200, /obj/item/pamphlet/skill/medic, null, VENDOR_ITEM_RECOMMENDED),
		list("Survival", 200, /obj/item/pamphlet/skill/survival, null, VENDOR_ITEM_RECOMMENDED),
		list("Teammate", 200, /obj/item/pamphlet/skill/teammate, null, VENDOR_ITEM_RECOMMENDED),
		list("Retriever", 200, /obj/item/pamphlet/skill/retriever, null, VENDOR_ITEM_RECOMMENDED),

		list("ADDITIONAL HANDHELD DEFENSE", 0, null, null, null),
		list("21S Tesla Coil", 175, /obj/item/defenses/handheld/tesla_coil, null, VENDOR_ITEM_REGULAR),
		list("JIMA Planted Flag", 175, /obj/item/defenses/handheld/planted_flag, null, VENDOR_ITEM_REGULAR),
		list("R-1NG Bell Tower", 175, /obj/item/defenses/handheld/bell_tower, null, VENDOR_ITEM_REGULAR),
		list("UA 42-F Sentry Flamer", 175, /obj/item/defenses/handheld/sentry/flamer, null, VENDOR_ITEM_REGULAR),
		list("UA 571-C Sentry Gun", 175, /obj/item/defenses/handheld/sentry, null,VENDOR_ITEM_REGULAR),
		list("Sentry Upgrade kit", 25, /obj/item/engi_upgrade_kit, null, VENDOR_ITEM_REGULAR)
	)
