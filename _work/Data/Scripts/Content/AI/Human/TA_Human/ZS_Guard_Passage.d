// *********************************************************************
// ZS_Guard_Passage
// ----------------
// Torwachen erhalten in der AI an einigen Stellen eine Sonderbehandlung
// Torwachen halten Spieler über Important-Dialogmodule auf
// *********************************************************************

func void ZS_Guard_Passage ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	// ------ PercTime überschreiben ------
	Npc_SetPercTime		(self, 0.1);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		AI_AlignToWP	(self);
	};
};

func int ZS_Guard_Passage_Loop ()
{
	// ------ Alle 3 Sekunden -------
	if (Npc_GetStateTime(self) >= 3)
	{
		if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
		{
			AI_AlignToWP	(self);
			Npc_SetStateTime(self,0);
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Guard_Passage_End ()
{

};




