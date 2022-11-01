// ************************************
// ZS_RunToWP
// ----------
// Wird als TA für die Story verwendet, 
// wenn ein NSC mal eben wegrennen soll
// ************************************

func void ZS_RunToWP ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	AI_SetWalkmode (self, NPC_RUN);

	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	
	AI_AlignToWP (self);
	
	AI_PlayAni (self,"T_STAND_2_HGUARD");
};

func int ZS_RunToWP_Loop ()
{	
	// ------ Wenn angekommen. Random-Ani ------
	if (Npc_GetStateTime(self) > 5)
	{
		var int random;	random = Hlp_Random(2);
		
		if (random == 0)
		{
			 AI_PlayAni (self,"T_HGUARD_LOOKAROUND");
		};
		
		Npc_SetStateTime (self, 0);
	};

	return LOOP_CONTINUE;
};
	
func int ZS_RunToWP_End ()
{	
	
};


		
	
	
