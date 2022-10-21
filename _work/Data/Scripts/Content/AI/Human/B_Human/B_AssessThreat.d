// ****************************************************
// B_AssessThreat
// --------------
// Aufgerufen durch Wahrnehmung AssessThreat
// wenn der Spieler(!) mit FK-Waffe auf einen NSC zielt
// PERC_DIST_INTERMEDIAT
// ****************************************************

func void B_AssessThreat ()
{
	// EXIT IF...
	
	// ------ weiter weg als PERC_DIST für ASSESSTHREAT ------
	if (Npc_GetDistToNpc(self, other) > PERC_DIST_INTERMEDIAT)
	{
		return;
	};
	
	// ------ NPC kann den Spieler nicht sehen ------			//wird einmal in der Sekunde aufgerufen, weil Programm einmal in der Sekunde Wahrnehmung aussendet
	if (!Npc_CanSeeNpc(self,other))
	{
		return;
	};
	
	// ------ gezogene Waffen sind diesem NPC egal ------
	if (!C_NpcIsBotheredByWeapon (self, other))
	{
		return;
	};
	

	// FUNC 
	
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_ReactToWeapon, 0, "");
	return;
};

