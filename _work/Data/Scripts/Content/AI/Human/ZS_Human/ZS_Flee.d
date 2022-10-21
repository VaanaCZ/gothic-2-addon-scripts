// *******************************
// ZS_Flee
// -------
// Wird aufgerufen durch ZS_Attack
// *******************************

func void ZS_Flee ()
{	
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic			);			

	B_ValidateOther();
	
	
	// FUNC

	if (self.aivar[AIV_LOADGAME] == FALSE)
	{
		B_Say_Overlay (self, other, "$RUNAWAY"); //Nichts wie weg!
	};

	AI_RemoveWeapon (self); //falls Waffe noch gezogen (z.B. nach ZS_ReactToDamage --> ZS_Attack --> ZS_Flee)
	
	AI_SetWalkmode 		(self, NPC_RUN);
	Mdl_ApplyOverlayMds	(self, "HUMANS_FLEE.MDS");
};

func int ZS_Flee_Loop ()
{
	Npc_GetTarget (self); // other = target
	
	
	// EXIT LOOP IF...
	
	// ------ Gegner weit genug weg ------
	if (Npc_GetDistToNpc(self,	other) > FIGHT_DIST_CANCEL)
	{																
		Npc_ClearAIQueue(self);
		return LOOP_END;									
	};
		
	// ------ Gegner platt ------
	if (C_NpcIsDown(other))
	{															
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};

	// LOOP FUNC
	
	AI_Flee	(self);
		
	return LOOP_CONTINUE;
};

func void ZS_Flee_End ()
{
	Mdl_RemoveOverlayMDS (self,"HUMANS_FLEE.MDS");
	
	AI_StandUp 		(self);
	AI_StartState 	(self, ZS_HealSelf, 1, "");
	return;
};

