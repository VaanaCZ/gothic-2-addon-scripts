// *******************
// C_NpcHasAmbientNews
// *******************

func int C_NpcHasAmbientNews (var C_NPC slf)
{		
	// ------ NSC petzt, hat aber hat keinen automatischen NEWS-Dialog ------
	if (slf.aivar[AIV_NewsOverride] == TRUE)
	{
		return FALSE;
	};
	
	if (B_GetPlayerCrime(slf) == CRIME_NONE)
	{
		return FALSE;
	};

	return TRUE; //Default
};
