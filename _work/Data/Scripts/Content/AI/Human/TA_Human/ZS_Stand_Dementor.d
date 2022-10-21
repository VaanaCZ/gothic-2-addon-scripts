func void ZS_Stand_Dementor()
{
	// --- Die Senses bei jedem Zustand neu setzen (Weil in ZS_Guide_Player die Senses & Ranges verändert werden) ------
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;		
	self.senses_range	= PERC_DIST_MONSTER_ACTIVE_MAX;			
	
	// --- Takt der aktiven Wahrnehmungen ------------------------------------------------
	if (Npc_KnowsInfo(self, 1))
	{
		Npc_SetPercTime		(self, 0.3);
	}
	else
	{
		Npc_SetPercTime		(self, 1);
	};
	
	// --- aktiv ------------------------------------------------------------------------- //aktive Wahrnehmungen werden IMMER den passiven bevorzugt (priorisiert)
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessPlayer				); //Player wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack
			
	// --- passiv ------------------------------------------------------------------------ //Passive Wahrnehmungen werden durch die Reihenfolge der Anmeldung priorisiert!
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_AssessDamage				); //geht in ZS_Attack oder in ZS_ReactToDamage (bei Freunden)

	if (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DMT_1299_OberDementor_DI))	//Joly:soll erst mit SC Quatschen!
		{
			Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			); //geht in ZS_WatchFight oder ZS_Attack
		};

	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	 	); //geht in ZS_Attack
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				); //geht in ZS_Talk
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
	
	B_ResetAll (self);
	
	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Dementor_loop()
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
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Dementor_end()
{
	AI_PlayAni (self,"T_LGUARD_2_STAND");	
};


