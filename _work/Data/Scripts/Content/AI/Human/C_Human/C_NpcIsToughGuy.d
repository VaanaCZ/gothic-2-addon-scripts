// ***********************************************
// C_NpcIsToughGuy
// ---------------
// ist der NSC ein verweichlichter Städter = FALSE 
// oder ein harter Junge, z.B. Bauersknecht = TRUE
// ***********************************************

func int C_NpcIsToughGuy (var C_NPC slf)
{
	// ------ AIVAR ------
	if (slf.aivar[AIV_ToughGuy] == TRUE) 
	{
		return TRUE;
	};

	// ------ ToughGuy-Gilden ------
	if (slf.guild == GIL_SLD)
	|| (slf.guild == GIL_DJG)
	|| (slf.guild == GIL_BDT)
	|| (slf.guild == GIL_PIR)
	{
		return TRUE;
	};
	
	return FALSE; //Default
};
