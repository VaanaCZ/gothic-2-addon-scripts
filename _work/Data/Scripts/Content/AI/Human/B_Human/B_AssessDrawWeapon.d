// ***************************************************************
// B_AssessDrawWeapon
// ------------------
// wird durch PERC_DRAWWEAPON 
// und durch B_AssessPlayer aufgerufen
// Reichweite ist über Wahrnehmung eingestellt (PERC_DIST_DIALOG)
// ***************************************************************

func int B_AssessDrawWeapon()
{
	// EXIT IF...
	
	// ------ Spieler hat keine Waffe gezogen ------
	if (Npc_IsInFightMode (other, FMODE_NONE))
	{
		return FALSE;
	};	

	// ------ DISTANZ zu Täter größer als PERC_DIST_DIALOG ------
	if (Npc_GetDistToNpc(self, other) > PERC_DIST_DIALOG)
	{
		return FALSE;
	};
	
	// ------ die Waffe ist dem NSC egal ------
	if (!C_NpcIsBotheredByWeapon (self, other))
	{
		return FALSE;
	};

	// ------ nicht nochmal aufrufen ------
	if (Npc_IsInState(self, ZS_ReactToWeapon))
	{
		return FALSE;
	};
	
	if (Npc_IsInState(self, ZS_ObservePlayer))
	&& (Npc_WasInState(self, ZS_WatchFight))
	{
		return FALSE;
	};
	
	// ------ NSC kann SC mit Waffe nicht sehen ------
	if (!Npc_CanSeeNpc(self, other))
	{	
		return FALSE;
	};

	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_ReactToWeapon, 0, "");
	return TRUE;
};
