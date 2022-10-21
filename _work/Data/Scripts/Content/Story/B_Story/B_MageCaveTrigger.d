// ************************
// MAGECAVETRIGGER		
// ************************
// ()


FUNC VOID B_MAGECAVETRIGGER ()	
{			
	if (Npc_IsDead (MagicGolem) == FALSE)
	&& (MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
	if 	((Hlp_IsValidNpc (AGON))
		&& (!Npc_IsDead (AGON)))
		{
			AI_Teleport (AGON,"NW_TROLLAREA_PATH_02");
			Npc_ExchangeRoutine  (Agon,"GOLEMLIVES");
			AI_ContinueRoutine (AGON);
		};
	};
};
