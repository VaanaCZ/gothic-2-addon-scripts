
// ************************
// NSC benutzt Schleifstein
// ************************

FUNC VOID ZS_Smith_Sharp ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Smith_Sharp_Loop ()
{
	// ------ Schmieden ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"BSSHARP"))
	{
		AI_UseMob (self, "BSSHARP", 1);
	};
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Smith_Sharp_End ()
{
	AI_UseMob (self, "BSSHARP", -1);
};
