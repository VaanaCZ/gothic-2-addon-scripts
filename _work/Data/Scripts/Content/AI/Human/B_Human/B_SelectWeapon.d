// *******************************************
// B_SelectWeapon
// --------------
// Bei Fernkämpfern wird Muni ins Inv gemogelt
// *******************************************

func void B_SelectWeapon(var C_NPC slf, var C_NPC oth)
{
	// EXIT IF...
	
	// ------ NSC im Wasser / beim Fallen ------
	if (C_BodyStateContains(slf,BS_FALL))
	|| (C_BodyStateContains(slf,BS_SWIM))
	|| (C_BodyStateContains(slf,BS_DIVE))
	{
		return;
	};
	
	// ------ Magie wählen oder behalten ------
	if (B_SelectSpell (slf, oth))		//bei HUMANS wählen nur Magier, Paladine oder Dementoren Magie
	{
		return; 			//Magie gewählt!
	};
	
	if (Npc_IsInFightMode(slf,FMODE_MAGIC))		//Habe Magie gezogen, will aber keine benutzen!!!
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon (slf);
		};
			
		AI_ReadyMeleeWeapon	(slf); //Schwert ziehen, sonst Fäuste
		return;
	};
	
	// ------ Fernkampfwaffe behalten ------
	if (Npc_IsInFightMode(slf,FMODE_FAR))
	{
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) 
		|| (!Npc_HasEquippedMeleeWeapon(slf))
		{
			return;
		};
	};
	
	// ------ Nahkampfwaffe behalten ------
	if (Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		if (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER)
		|| (!Npc_HasEquippedRangedWeapon(slf))
		{
			return;
		};
	};
	
		
	// FUNC
		
	// ------ NK-Waffe ziehen ------
	if (Npc_HasEquippedMeleeWeapon(slf))
	&& (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER)
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon (slf);
		};
			
		AI_ReadyMeleeWeapon	(slf); //Schwert ziehen, sonst Fäuste
		return;
	};
	
	// ------ Bogen ziehen ------
	if (Npc_HasEquippedRangedWeapon(slf))
	&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER)
	&& (C_NpcHasAttackReasonToKill (slf))
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon (slf);
		};
			
		AI_ReadyRangedWeapon (slf); //FK-Waffe ziehen
		return;
	};
	
	// ------ immer noch keine Waffe ------
	if (Npc_IsInFightMode (slf,FMODE_NONE))
	{
		// ------ dann Schwert, egal welche Distanz ------
		if (Npc_HasEquippedMeleeWeapon(slf))
		{
			AI_ReadyMeleeWeapon	(slf); //Schwert ziehen
			return;
		};
		
		// ------ wenn kein Schwert, dann Bogen, egal welche Distanz ------
		if (Npc_HasEquippedRangedWeapon(slf))
		{
			AI_ReadyRangedWeapon (slf); //FK-Waffe ziehen
			return;
		};
		
		// ----- wenn gar keine Waffe: Default (Fäuste) ------
		AI_ReadyMeleeWeapon	(slf);
		return;
	};
	
	return;
};




