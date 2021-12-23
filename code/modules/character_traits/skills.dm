/datum/character_trait_group/skills
	trait_group_name = "Skills"
	group_visible = FALSE


/datum/character_trait/skills
	var/skill //The skill that will be upgraded
	var/secondary_skill //Put a second skill here if two are needed
	var/skill_increment = 1 //How much the skill level is increased
	var/skill_cap = 1 //The maximum level this can get the skill to
	var/secondary_skill_cap
	applyable = FALSE
	trait_group = /datum/character_trait_group/skills

/datum/character_trait/skills/New()
	..()

	if(!secondary_skill_cap)
		secondary_skill_cap = skill_cap


/datum/character_trait/skills/apply_trait(mob/living/carbon/human/target)
	..()

	target.skills.increment_skill(skill,skill_increment,skill_cap)

	target.skills.increment_skill(secondary_skill,skill_increment,secondary_skill_cap)


/datum/character_trait/skills/unapply_trait(mob/living/carbon/human/target)
	..()

	target.skills.decrement_skill(skill,skill_increment)

	if (secondary_skill)
		target.skills.decrement_skill(secondary_skill,skill_increment)


	/*
/datum/character_trait/skills/
	trait_name = ""
	trait_desc = ""
	skill =
	*/


/datum/character_trait/skills/medical
	trait_name = "First Aid Training"
	trait_desc = "Boosts the medical skill to 1. Crewmember has attended several first aid training sessions and learned basic medical care."
	skill = SKILL_MEDICAL

/datum/character_trait/skills/engineering
	trait_name = "Basic Engineering Training"
	trait_desc = "Boosts the engineering skill to 1. Crewmember received basic training in repairing simple machinery and fortifications."
	skill = SKILL_ENGINEER

/datum/character_trait/skills/construction
	trait_name = "Basic Construction Training"
	trait_desc = "Boosts the construction skill to 1. Crewmember received training in constructing simple fortifications."
	skill = SKILL_CONSTRUCTION

/datum/character_trait/skills/miniengie
	trait_name = "Field Technician Training"
	trait_desc = "Boosts the construction and engineering skills to 1. Crewmember received basic training in creating fortifications and maintaining simple machinery."
	skill = SKILL_CONSTRUCTION
	secondary_skill = SKILL_ENGINEER

/datum/character_trait/skills/miniengie/antag
	trait_name = "Field Technician Training"
	trait_desc = "Boosts the construction and engineering skills to 2. Crewmember received full training in creating fortifications and maintaining variousmachinery."
	skill_cap = 2
	skill_increment = 2

/datum/character_trait/skills/vc
	trait_name = "Vehicle Crewman Training"
	trait_desc = "Boosts the engineering and vehicle operation skills to 2. Crewmember received full vehicle crewman training."
	skill = SKILL_VEHICLE
	secondary_skill = SKILL_ENGINEER
	skill_cap = 3
	secondary_skill_cap = 2
	skill_increment = 3

/datum/character_trait/skills/jtac
	trait_name = "JTAC Training"
	trait_desc = "Boosts the JTAC skill by 1. Crewmember received additional training in using JTAC equipment."
	skill = SKILL_JTAC

/datum/character_trait/skills/powerloader
	trait_name = "Powerloader Usage Training"
	trait_desc = "Boosts the powerloader skill to 1. Crewmember received training in operating powerloaders."
	skill = SKILL_POWERLOADER

/datum/character_trait/skills/medic
	trait_name = "Medical Training"
	trait_desc = "Boosts the surgery to 1 and medical skills to 1. Crewmember received full training in medical and maintaining simple surgery help."
	skill = SKILL_MEDICAL
	secondary_skill = SKILL_SURGERY
	skill_cap = 2
	secondary_skill_cap = 1
	skill_increment = 2

/datum/character_trait/skills/survival
	trait_name = "Survival Training"
	trait_desc = "Boosts the endurance to 4 and CQC to 3. Crewmember received advanced techniques to withstand damage and good training in CQC to evade attacks."
	skill = SKILL_ENDURANCE
	secondary_skill = SKILL_CQC
	skill_cap = 3
	secondary_skill_cap = 2
	skill_increment = 2

/datum/character_trait/skills/teammate
	trait_name = "Team Training"
	trait_desc = "Boosts the leadership to 2 and firearms to 2. Crewmember received training in shouting orders and additional training in firearms to help their teammates."
	skill = SKILL_LEADERSHIP
	secondary_skill = SKILL_FIREARMS
	skill_cap = 2
	secondary_skill_cap = 2
	skill_increment = 2

/datum/character_trait/skills/retriever
	trait_name = "Retriever Training"
	trait_desc = "Boosts the CQC to 2 and police to 1. Crewmember received avanced training in retrieving injured fellow teammates and evading incoming attacks."
	skill = SKILL_CQC
	secondary_skill = SKILL_POLICE
	skill_cap = 4
	secondary_skill_cap = 1
	skill_increment = 3
