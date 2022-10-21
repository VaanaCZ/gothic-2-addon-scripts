// ************************
// NSC dreht Scavengergrill
// ************************

FUNC VOID ZS_Roast_Scavenger ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Roast_Scavenger_Loop ()
{
	// ------ Grill drehen ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"BARBQ"))
	{
		AI_UseMob (self, "BARBQ", 1);
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Roast_Scavenger_End ()
{
	AI_UseMob (self, "BARBQ", -1);
};



