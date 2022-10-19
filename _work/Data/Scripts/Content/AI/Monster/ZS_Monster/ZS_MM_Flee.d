func void ZS_MM_Flee ()
{
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,	B_AssessMagic);	
	
	B_ValidateOther();

	AI_StandUp		(self);
	AI_SetWalkmode 	(self, NPC_RUN);
	
	Npc_SendPassivePerc	(self, PERC_ASSESSWARN, other, self); // Opfer, Täter
	
	B_MM_DeSynchronize();
};

func int ZS_MM_Flee_Loop ()
{
	Npc_GetTarget (self); // other = target
	
	if (Npc_GetDistToNpc(self,	other) < 2000)
	{																
		if (Npc_GetStateTime(self) > 0)
		{
			Npc_SendPassivePerc	(self, PERC_ASSESSWARN, other, self); // Opfer, Täter
			
			Npc_SetStateTime(self, 0);
		};
		
		AI_Flee (self);
		
		return LOOP_CONTINUE;
	}
	else
	{			
		Npc_ClearAIQueue(self);
		return LOOP_END;													
	};
};

func void ZS_MM_Flee_End ()
{

};
