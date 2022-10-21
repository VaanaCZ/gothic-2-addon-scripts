// ************************************
// ZS_FleeToWp
// -----------
// Wird als TA für die Story verwendet, 
// wenn ein NSC fliehen soll
// ************************************

func void ZS_FleeToWp ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	if  Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Cornelius)
	{
		Npc_PercDisable (self,PERC_ASSESSENTERROOM);
	};
	//B_Say_Overlay (self, other, "$RUNAWAY"); //kommst sonst nach Dialog am Ankunftspunkt
	
	AI_SetWalkmode 		(self, NPC_RUN);
	Mdl_ApplyOverlayMds	(self, "HUMANS_FLEE.MDS");
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	
	AI_AlignToWP (self);
	AI_PlayAni (self,"T_STAND_2_HGUARD");
};

func int ZS_FleeToWp_Loop ()
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
	
func int ZS_FleeToWp_End ()
{	
	
};


		
	
	
