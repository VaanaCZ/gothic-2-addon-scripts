//ADDON
// *********************
// NPC studiert auf WP 
// *********************

func void ZS_Study_WP ()
{	
	Perception_Set_Normal();

	B_ResetAll (self);
	
	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP	(self, self.wp);
	AI_AlignToWP(self);

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Study_WP_loop()
{
	var int randy;
	var int eventrandy;
	var int randystatetime;

	randystatetime = randy + 25;

	randy = Hlp_Random (10);
	eventrandy = Hlp_Random (100);
	var int wait;
	var float waittime;
	wait = randy +	5;
	waittime = IntToFloat (wait);

	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	
	AI_AlignToWP    (self);
	
	if (Npc_GetStateTime(self) >= randystatetime)
	{
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			B_TurnToNpc		(self,	hero);
		};
		
		// ------ NSC steckt ggf. Waffe weg ------
		AI_RemoveWeapon (self);
		
		if (randy <= 3)
		{
			if (randy == 0)
			{
				AI_PlayAni (self,"T_LGUARD_SCRATCH");
			}
			else if (randy == 1)
			{
				AI_PlayAni (self,"T_LGUARD_STRETCH");
			}
			else if (randy == 2)
			{
				AI_PlayAni (self,"T_LGUARD_CHANGELEG");
			};
		}
		else
		{
			AI_PlayAni (self,"T_LGUARD_2_STAND");
			self.aivar[AIV_TAPOSITION] = NOTINPOS;

			if (Npc_HasItems (self,Fakescroll_Addon) == FALSE)
			{
				CreateInvItem	(self,	Fakescroll_Addon);
			};
			
			B_StopLookAt 			(self);		
			AI_UseItemToState	(self,	Fakescroll_Addon,	1);
		
			AI_Wait				(self,	waittime);
			AI_UseItemToState	(self,	Fakescroll_Addon,	-1);
			Npc_SetStateTime(self, 0);
	
			if  (
				   ((eventrandy < 5) && (CurrentLevel == NEWWORLD_ZEN))
				|| ((eventrandy == 1) && (CurrentLevel == ADDONWORLD_ZEN))
				)
				&& (self.guild == GIL_KDW)//Erdbeben überall wo die KDW herumhängen
				&& (RavenIsDead == FALSE) 
					{
						B_EVENT_PORTAL_EARTHQUAKE ();			
					};
		};
	}

	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};	
	
	return LOOP_CONTINUE;
};

func void ZS_Study_WP_end()
{
	Npc_RemoveInvItems	(self, Fakescroll_Addon, Npc_HasItems (other,Fakescroll_Addon));
};	
