// ************************************************************
// B_SetFightSkills
// ----------------
// B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance%
// ************************************************************

func void B_SetFightSkills (var C_NPC slf, var int percent)
{
	// Es wird auf alle FightSkills percent ADDIERT (Skills sind in Npc_Default auf 0 initialisiert)

	B_RaiseFightTalent (slf, NPC_TALENT_1H, 		percent);
	B_RaiseFightTalent (slf, NPC_TALENT_2H, 		percent);
	B_RaiseFightTalent (slf, NPC_TALENT_BOW, 		percent);
	B_RaiseFightTalent (slf, NPC_TALENT_CROSSBOW,	percent);
};
