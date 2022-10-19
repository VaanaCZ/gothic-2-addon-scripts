// *************************
// C_IsTakenItemMyPossession
// *************************

func int C_IsTakenItemMyPossession (var C_NPC slf, var C_NPC oth, var C_ITEM itm)
{
	var int portalguild;    	portalguild 		= Wld_GetPlayerPortalGuild();
  
	
	// FUNC

	// ------ Persönliches Besitzflag ------
	if (Npc_OwnedByNpc(itm, slf)) 
	{
		// ------ Story: Der Hammer Innos ------
		if (Hlp_IsItem (itm, Holy_Hammer_MIS))
		// kann nur Nov_608_Garwig sein, weil Hammer persönlicher Besitz
		{
			Hammer_Taken = TRUE;
		};
		
		return TRUE;
	};
	
	// ------ wenn Spieler Item geDROPt hat ------
	if ((itm.flags & ITEM_DROPPED) == ITEM_DROPPED)
	{
		return FALSE;
	};
	
	// ------ wenn item in meinem Portalraum (oder Raum von befreundeter Gilde) genommen wurde ------
	if (C_NpcIsBotheredByPlayerRoomGuild(self))
	|| (Wld_GetPlayerPortalGuild() == GIL_PUBLIC)
	{
		return TRUE;
	};	
	
	// ------ Gildenbesitz BEFREUNDETER Gilde (ACHTUNG: Klappt nicht, wenn ich zu meiner eigenen Gilde nicht befreundet bin) ------
	if (Wld_GetGuildAttitude(slf.guild, itm.ownerguild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	
	return FALSE;
};
