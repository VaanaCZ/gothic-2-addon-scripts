// ************************************************
// B_FinishingMove
// ---------------
// FIX: stellt sicher, daﬂ NSC bei AI_FinishingMove
// auf JEDEN Fall eine Waffe hat
// ************************************************

func void B_FinishingMove(var C_NPC slf, var C_Npc oth)
{
	// ------ NK-Waffe ziehen (notfalls generieren), wenn keine gezogen ------
	if (!Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		Npc_SetToFightMode (slf, ItMw_1h_MISC_Sword);
	};
				
	// ------ Finishing Move - Gegner bleibt (vom Programm gezwungen) im ZS_Unconscious ------			
	AI_FinishingMove (slf, oth);
};
