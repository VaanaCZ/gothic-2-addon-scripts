// ************** 
// ZS_MM_Rtn_Rest
// **************

func void ZS_MM_Rtn_Rest()  
{
	Perception_Set_Monster_Rtn();

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Rest_Loop ()
{
	//ADDON>
	if (self.guild == GIL_STONEGUARDIAN)
	&& (RavenIsDead == TRUE)
	{	
		B_KillNpc (self);
	};
	//ADDON<
	
	
	if ((!Wld_IsTime (self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00)) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		return LOOP_END;
	};
	
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if (Wld_IsFPAvailable(self,	"FP_ROAM"))
		{
			AI_GotoFP (self, "FP_ROAM");
		};
		
		if (Npc_IsOnFP(self, "FP_ROAM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else //ISINPOS
	{
		if (Hlp_Random(1000) <= 5)
		{
			var int randomMove;
			randomMove = Hlp_Random(3);
			if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
			if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
			if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Rest_End ()
{

};







