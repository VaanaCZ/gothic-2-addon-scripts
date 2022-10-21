// ****************
// ZS_MM_Rtn_OrcSit
// ****************

func void ZS_MM_Rtn_OrcSit() 
{
	Perception_Set_Monster_Rtn();

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
		
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_OrcSit_loop()
{
	if ((!Wld_IsTime (self.aivar[AIV_MM_OrcSitStart],00,self.aivar[AIV_MM_OrcSitEnd],00)) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		return LOOP_END;
	};
		
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if (Wld_IsFPAvailable(self,	"FP_CAMPFIRE"))
		{
			AI_GotoFP (self, "FP_CAMPFIRE");
		};
		
		if (Npc_IsOnFP(self, "FP_CAMPFIRE"))
		{
			AI_PlayAniBS (self,	"T_STAND_2_GUARDSLEEP", BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else //ISINPOS
	{
		
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_OrcSit_end()
{
	AI_PlayAniBS		(self,	"T_GUARDSLEEP_2_STAND", BS_STAND);
};
