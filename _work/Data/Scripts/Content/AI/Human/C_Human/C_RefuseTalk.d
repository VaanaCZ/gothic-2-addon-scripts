// ************
// C_RefuseTalk
// ************

func int C_RefuseTalk (var C_NPC slf, var C_NPC oth)
{
	var C_Npc hnry;
	
	// ------ GateGuards von hinten ------
	if (Npc_RefuseTalk(slf) == TRUE)
	&& (C_NpcIsGateGuard(slf))
	&& (slf.aivar[AIV_Guardpassage_Status]	== GP_NONE)
	{
		hnry = Hlp_GetNpc(PIR_1354_Addon_Henry);
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hnry))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	};
	
	// ------ NSCs, die nicht abseits ihres Waypoints zum ersten Mal einen Dialog anfangen d�rfen ------
	if (slf.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_GetDistToWP(slf, slf.wp) > 500)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lothar))
		{
			return TRUE;
		};
	};
	
	//------ Player hat falsche R�stung an ------
	if C_PlayerHasFakeGuild (slf,oth)
	&& (self.flags != NPC_FLAG_IMMORTAL)
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};
