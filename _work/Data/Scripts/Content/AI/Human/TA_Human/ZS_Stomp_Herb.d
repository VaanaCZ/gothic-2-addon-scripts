// ***********************
// NSC benutzt Herbstomper
// ***********************

FUNC VOID ZS_Stomp_Herb ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Stomp_Herb_Loop ()
{
	// ------ Stampfen ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"HERB"))
	{
		AI_UseMob (self, "HERB", 1);
	};
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Stomp_Herb_End ()
{
	AI_UseMob (self, "HERB", -1);
};



