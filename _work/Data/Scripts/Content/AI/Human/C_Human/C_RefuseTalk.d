// ************
// C_RefuseTalk
// ************

func int C_RefuseTalk (var C_NPC slf, var C_NPC oth)
{
	// ------ GateGuards von hinten ------
	if (Npc_RefuseTalk(slf) == TRUE)
	&& (C_NpcIsGateGuard(slf))
	&& (slf.aivar[AIV_Guardpassage_Status]	== GP_NONE)
	{
		return TRUE;
	};
	
	// ------ NSCs, die nicht abseits ihres Waypoints zum ersten Mal einen Dialog anfangen dürfen ------
	if (slf.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_GetDistToWP(slf, slf.wp) > 500)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lothar))
		{
			return TRUE;
		};
	};
	
	//------ Player hat falsche Rüstung an ------
	if C_PlayerHasFakeGuild (slf,oth)
	&& (self.flags != NPC_FLAG_IMMORTAL)
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};
