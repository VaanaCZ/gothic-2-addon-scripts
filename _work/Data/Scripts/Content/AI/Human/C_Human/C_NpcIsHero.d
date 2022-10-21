FUNC INT C_NpcIsHero (var C_NPC slf)
{
	var C_NPC her;
	her = Hlp_GetNpc (PC_Hero);
	
	if  (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(her))
	{
		return TRUE;
	};
 	
	return FALSE;
};

