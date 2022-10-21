func void ZS_Stand_RangerMeeting ()
{
	Perception_Set_Minimal();
	
	B_ResetAll (self);
	
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;		//Sense_Smell erforderlich, da der Sc sonst nicht "gesehen wird)!!	
	self.senses_range	= 500;									//Damit der SC nicht sofort aus dem Wahrnehmungskreis des NSCs verschwindet 
	Npc_SetPercTime		(self,	1);								//Damit er öfter reagiert!
	
	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_AssessGuidePlayer			); //Player wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk //mustte ich noch mal aufröseln)
	Npc_PercEnable 		(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack

	if  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Lares)))
	||  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Erol)))
	||  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Greg_NW))) //Joly:Ja,ja, ich weiß. GANZ BÖSE.
	{
		Npc_PercEnable	 	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				); //geht in ZS_Talk
	};
	
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
	Npc_PercEnable		(self,  PERC_ASSESSFIGHTSOUND	, 	B_AssessGuideFightSound		);	

	if  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Lares)))
	||  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Greg_NW)))
	{
		AI_SetWalkmode (self, NPC_RUN);
	
		if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	    {
			AI_GotoWP	(self, self.wp);
		};
		
		AI_AlignToWP (self);
		
		AI_PlayAni (self,"T_STAND_2_HGUARD");
	}
	else	//Joly: andere Ranger
	{
		AI_SetWalkmode 	(self, NPC_WALK);		
		
		if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	    {
			AI_GotoWP	(self, self.wp);
		};
		
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
};

func int ZS_Stand_RangerMeeting_loop()
{
	var int random;	

	if  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Lares)))
	{
		// ------ Wenn angekommen. Random-Ani ------
		if (Npc_GetStateTime(self) > 5)
		{
			random = Hlp_Random(2);
			
			if (random == 0)
			{
				 AI_PlayAni (self,"T_HGUARD_LOOKAROUND");
			};
			
			Npc_SetStateTime (self, 0);
		};
	}
	else
	{
		if (Npc_IsOnFP (self, "STAND"))
		{	
			AI_AlignToFP (self);
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
	  		{
	  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
	  		};
		}	
		else if (Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP 		(self, "STAND");
			AI_StandUp 		(self);
			AI_AlignToFP 	(self);
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
		}
		else
		{
			AI_AlignToWP (self);
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
	  		{
	  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
	  		}; 
		};
		
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
		{
			AI_StandUp 		(self);
			AI_PlayAni (self,"T_STAND_2_LGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		
	//*******************************************************
	//	Hier dann die Random Anis
	//*******************************************************		
		
		if ((Npc_GetStateTime(self) > 5)
		&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			random = Hlp_Random(7);
			
			if (random == 0)
			{
				AI_PlayAni (self,"T_LGUARD_SCRATCH");
			}
			else if (random == 1)
			{
				AI_PlayAni (self,"T_LGUARD_STRETCH");
			}
			else if (random == 2)
			{
				AI_PlayAni (self,"T_LGUARD_CHANGELEG");
			};
			
			Npc_SetStateTime (self, 0);
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_RangerMeeting_end ()
{
	if  ((Hlp_GetInstanceID (self)) == (Hlp_GetInstanceID (Lares)))
	{
	}
	else
	{
		AI_PlayAni (self,"T_LGUARD_2_STAND");	
	};
};


