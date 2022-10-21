// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        G R E E N T E N T A C L E        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


// *****************
// B_StopSwarm
// *****************

func void B_RestartGreententacle()
{
	if (Npc_GetLastHitSpellID(self) == SPL_Greententacle)
	{
		Npc_SetStateTime(self,0);
	};
};


func void B_StopGreententacle()
{	
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
	}
	else
	{
		Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
	};
	
	// nach Aufruf dieses Befehles wird die Loop über return LOOP_END beendet
};

// **************
// ZS_Greententacle
// **************

func int ZS_Greententacle()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartGreententacle); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE, B_AssessDamage);
	
	Npc_StopAni(self, "s_GreententacleA_Victim");										// falls der NSC am Zappeln ist, brich die Ani ab
	Npc_StopAni(self, "s_GreententacleB_Victim");
	Npc_StopAni(self, "s_GreententacleC_Victim");

	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		if (self.guild < GIL_SEPERATOR_HUM)
		{
			var int randy;
			//randy = Hlp_Random (3);
	
			if (randy == 0)		{		AI_PlayAniBS (self,	"T_STAND_2_GREENTENTACLEA_VICTIM",	 BS_UNCONSCIOUS);		};
			if (randy == 1)		{		AI_PlayAniBS (self,	"T_STAND_2_GREENTENTACLEB_VICTIM",	 BS_UNCONSCIOUS);		};
			if (randy == 2)		{		AI_PlayAniBS (self,	"T_STAND_2_GREENTENTACLEC_VICTIM",	 BS_UNCONSCIOUS);		};
		}
		else
		{
			AI_PlayAniBS 		(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
		};
	};
	//self.aivar[AIV_GreenTentacleStateTime] = 0;
};



func int ZS_Greententacle_Loop ()
{	
	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > SPL_TIME_Greententacle)
	{
		B_StopGreententacle();
		return LOOP_END;
	};
	/*
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_GreententacleStateTime])
	{
		if (Npc_GetStateTime(self) == 2) 
		{  
			B_Say (self, other, "$RunAway");
		}
		else if (Npc_GetStateTime(self) == 6) 
		{ 
			B_Say (self, other, "$Aargh_2");
		}
		else if (Npc_GetStateTime(self) == 7)
		{
			B_Say (self, other, "$Aargh_3");
		}
		else if (Npc_GetStateTime(self) == 8)
		{
			B_Say (self, other, "$Aargh_1");
		};
		
		 
		self.aivar[AIV_GreententacleStateTime] = Npc_GetStateTime(self);
	*/
		
	return				LOOP_CONTINUE;
};


func void ZS_GreenTentacle_End()
{

};

/*


func int B_StopGreententacle()
{
	Npc_PercDisable	(self,	PERC_ASSESSDAMAGE); //weil Wahrnehmung unten auf B_StopMagicSleep verweist

	//AI_PlayAni			(self, "T_VICTIM_SLE_2_STAND");	
	
	Npc_SetTarget 		(self, other);
	
	// nach Aufruf dieses Befehles wird die Loop über return LOOP_END beendet (weiter im TA)
};		


// *************
// ZS_Greententacle
// *************

func void ZS_Greententacle ()
{
	// der ZS_MagicSleep beendet sich selbst im loop, daher ist keine perception PERC_ASSESSSTOPMAGIC nötig, und darf
	// auch nicht gesetzt werden, ansonsten wird der diesen zustand aktivierende effekt wenn er beendet ist (z.B. weil
	// der partikeleffekt stirbt) ein assessstopmagic senden, und dadurch illegalerweise vorzeitig den zustand beenden
	// mit anderen worten: der pfx triggert diesen zustand, und der zustand beendet sich selbst
	
	var int randy;
	
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE, 		B_StopGreententacle);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,		B_AssessMagic);

	// ------ Guardpassage resetten ------
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	
	// ------ RefuseTalk Counter resetten -----
	Npc_SetRefuseTalk(self,0);
	
	// ------ Temp_Att (upset) "resetten" ------
	Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));

	// ------ Bewegungs-Overlays resetten ------	
	B_StopLookAt	(self);
	B_Say (self, other, "$RunAway");
	AI_StopPointAt	(self);
	
		
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		randy = Hlp_Random (3);

		if (randy == 0)		{		AI_PlayAniBS (self,	"T_STAND_2_GREENTENTACLEA_VICTIM",	 BS_STAND);		};
		if (randy == 1)		{		AI_PlayAniBS (self,	"T_STAND_2_GREENTENTACLEB_VICTIM",	 BS_STAND);		};
		if (randy == 2)		{		AI_PlayAniBS (self,	"T_STAND_2_GREENTENTACLEC_VICTIM",	 BS_STAND);		};
	};

};

func int ZS_Greententacle_Loop ()
{	
	if (Npc_GetStateTime(self) > SPL_Time_Greententacle)
	{
		Npc_ClearAIQueue(self);
		B_StopGreententacle();
		return LOOP_END;
	};
	
};

func void ZS_Greententacle_End()
{

};

*/
