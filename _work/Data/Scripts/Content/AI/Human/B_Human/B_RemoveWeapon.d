// **************
// B_RemoveWeapon
// **************

func void B_RemoveWeapon (var C_NPC slf)
{
	// ------ alter Script-Workaround - AI_StopAim ist jetzt in AI_RemoveWeapon enthalten
	//if (Npc_HasReadiedRangedWeapon (slf))
	//{
	//	AI_StopAim (slf);
	//};
	
	AI_RemoveWeapon (slf); //Fäuste, NK/FK-Waffen oder Magie wegstecken
};
