// **********************************
// NSC benutzt Wassereimer (Schmiede)
// **********************************

FUNC VOID ZS_Smith_Cool ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Smith_Cool_Loop ()
{
	// ------ Schmieden ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"BSCOOL"))
	{
		AI_UseMob (self, "BSCOOL", 1);
	};
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Smith_Cool_End ()
{
	AI_UseMob (self, "BSCOOL", -1);
};
