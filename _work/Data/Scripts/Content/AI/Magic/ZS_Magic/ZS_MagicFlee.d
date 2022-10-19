// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        F E A R          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



// **************************************
// B_StopMagicSleep
// ----------------
// wird aus ZS_MAgicSleep_loop aufgerufen
// wenn SPL_Time_Sleep vorbei ist
// **************************************

func int B_StopMagicFlee()
{
	Npc_PercDisable	(self,	PERC_ASSESSDAMAGE); //weil Wahrnehmung unten auf B_StopMagicSleep verweist

	//AI_PlayAni			(self, "T_VICTIM_SLE_2_STAND");	
	
	Npc_SetTarget 		(self, other);
	AI_StartState 		(self, ZS_Flee, 0, "");
	
	// nach Aufruf dieses Befehles wird die Loop über return LOOP_END beendet (weiter im TA)
};		


// *************
// ZS_MagicSleep
// *************

func void ZS_MagicFlee ()
{
	// der ZS_MagicSleep beendet sich selbst im loop, daher ist keine perception PERC_ASSESSSTOPMAGIC nötig, und darf
	// auch nicht gesetzt werden, ansonsten wird der diesen zustand aktivierende effekt wenn er beendet ist (z.B. weil
	// der partikeleffekt stirbt) ein assessstopmagic senden, und dadurch illegalerweise vorzeitig den zustand beenden
	// mit anderen worten: der pfx triggert diesen zustand, und der zustand beendet sich selbst
	
	if self.guild == GIL_DRAGON
	{
		AI_ContinueRoutine (self);
	};
	
	var int randy;
	
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE, 		B_StopMagicFlee);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,		B_AssessMagic);

	// ------ Guardpassage resetten ------
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	
	// ------ RefuseTalk Counter resetten -----
	Npc_SetRefuseTalk(self,0);
	
	// ------ Temp_Att (upset) "resetten" ------
	Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));

	// ------ Bewegungs-Overlays resetten ------	
	B_StopLookAt	(self);
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

		if (randy == 0)		{		AI_PlayAniBS (self,	"T_STAND_2_FEAR_VICTIM1",	 BS_STAND);		};
		if (randy == 1)		{		AI_PlayAniBS (self,	"T_STAND_2_FEAR_VICTIM2",	 BS_STAND);		};
		if (randy == 2)		{		AI_PlayAniBS (self,	"T_STAND_2_FEAR_VICTIM3",	 BS_STAND);		};
	};


	
	
};

func int ZS_MagicFlee_Loop ()
{	
	if (Npc_GetStateTime(self) > SPL_Time_Fear)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicFlee();
		//return LOOP_END;
	};
};

func void ZS_MagicFlee_End()
{

};

