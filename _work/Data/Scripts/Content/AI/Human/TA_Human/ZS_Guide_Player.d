// ***************
// ZS_Guide_Player
// ***************
FUNC void B_AssessGuidePlayer ()
{
	if (Npc_GetDistToNpc(self, hero) > 800)
	{
		if (Npc_GetDistToWP (self, self.wp) < Npc_GetDistToWP (hero, self.wp))
		{		
			Npc_ClearAIQueue (self);
			AI_StandUp (self);
			B_TurnToNpc (self,hero);
		};
		
		// ------ Sonderfall: EnemyOverride fliegt weg, wenn SC dem Enemy nicht folgt! ------
		
		if (Npc_GetDistToNpc(self, hero) > 1200)
		&& (self.aivar [AIV_EnemyOverride] == TRUE)
		&& (Npc_GetAttitude(self, hero) == ATT_HOSTILE)
		{
			self.aivar [AIV_EnemyOverride] = FALSE;
		};
	}
	else
	{
		B_AssessPlayer ();
	};
};

func void B_AssessGuideFightSound()
{
	if (Npc_IsPlayer(other))
	|| (Npc_IsPlayer(victim))
	{
		B_AssessFightSound ();
	};
};


func void ZS_Guide_Player ()
{
	Perception_Set_Minimal();
	
	B_ResetAll (self);
	
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;		//Sense_Smell erforderlich, da der Sc sonst nicht "gesehen wird)!!	
	self.senses_range	= 2000;									//Damit der SC nicht sofort aus dem Wahrnehmungskreis des NSCs verschwindet 
	Npc_SetPercTime		(self,	1);								//Damit er öfter reagiert!
	
	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_AssessGuidePlayer			); //Player wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk //mustte ich noch mal aufröseln)
	Npc_PercEnable 		(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack
	Npc_PercEnable	 	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				); //geht in ZS_Talk
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
	Npc_PercEnable		(self,  PERC_ASSESSFIGHTSOUND	, 	B_AssessGuideFightSound		);
};

func int ZS_Guide_Player_Loop ()
{	
	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > 800)
	&& (Npc_GetDistToWP (self, self.wp) < Npc_GetDistToWP (hero, self.wp))
	{
		B_AssessGuidePlayer();
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > 300)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode (self, NPC_RUN);
		};
		AI_GotoWP (self, self.wp);
	}
	
	//-------- Ziel erreicht ! --------
	else
	{
		B_TurnToNpc (self, hero);
	};

	return LOOP_CONTINUE;
};
	
func int ZS_Guide_Player_End ()
{	
	
};

























