// *************************
// NSC setzt sich auf Throne
// *************************

func void ZS_Sit_Throne ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
    
	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_SetWalkmode 	(self, NPC_WALK);		
	
		if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    	{
			AI_GotoWP	(self, self.wp);
		};
	};
};

func int ZS_Sit_Throne_Loop ()
{
	// ------ Hinsetzen ------
	if (!C_BodyStateContains(self, BS_SIT))
	&& (Wld_IsMobAvailable(self,"THRONE"))
	{
		AI_UseMob (self, "THRONE", 1);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Sit_Throne_End ()
{
	AI_UseMob			(self,"THRONE",-1);
};

