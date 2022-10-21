// ****************************
// NSC benutzt Repair-Hut-Mobsi
// ****************************

FUNC VOID ZS_Repair_Hut ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Repair_Hut_Loop ()
{
	// ------ Hämmern ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"REPAIR"))
	{
		AI_UseMob (self, "REPAIR", 1);
	};
	
	// ------ Random-Ani beim Hämmern ------
	if (Npc_GetStateTime(self) > 5)
	&& (C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
    {
    	var int zufall; zufall = Hlp_Random(100);  
    
       	if (zufall < 50)
    	{
    		AI_PlayAniBS (self, "T_REPAIR_RANDOM_1", BS_MOBINTERACT_INTERRUPT);
    	};
    	
    	Npc_SetStateTime (self, 0);
    };
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Repair_Hut_End ()
{
	AI_UseMob (self, "REPAIR", -1);
};



