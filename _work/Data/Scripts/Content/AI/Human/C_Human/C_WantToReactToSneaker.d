// **********************
// C_WantToReactToSneaker
// **********************

func int C_WantToReactToSneaker(var C_NPC slf, var C_NPC oth)
{
    // ------ zu weit weg ------
    if (Npc_GetDistToNpc(slf, oth) > 700)
    {
    	return FALSE;
    };
    
    // ------ ausgenommene Gilden ------
    if (slf.guild == GIL_DMT)
	|| (slf.guild == GIL_STRF)
	
	//Addon: Banditen im Lager sollen auf Schleicher reagieren
	|| ((slf.guild == GIL_BDT) 
	&& !C_NpcBelongsToBL(slf)) 
	{
		return FALSE;
	};
    
    // ------ NPCTYPE FRIEND ------
    if (slf.npctype == NPCTYPE_FRIEND) && (Npc_IsPlayer(oth))
    {
		return FALSE;
	};
	
	// ------ ATT_FRIENDLY ------
	if (Npc_GetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	
	// ------ Torwachen bleiben stehen ------
	if (C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
		
	return TRUE; //DEFAULT
};
