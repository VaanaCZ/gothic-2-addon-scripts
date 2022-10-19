// *****************************************************
// B_StopPyro
// ----------
// wird aufgerufen durch PERC_ASSESSSTOPMAGIC in ZS_Pyro
// *****************************************************

func void B_StopPyro()
{	
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic); //falls in diesem Frame (während des Ausführens des B_) noch ein neuer Spruch wirkt
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine	(self); //Sicherheitshalber, falls B_AssessDamage NICHT in neuen ZS weiterleitet (kann z.ZT. aber nicht passieren) 
									// - sonst würde NPC in Loop hängenbleiben
	}
	else
	{
		Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
		AI_ContinueRoutine	(self); //sonst bleibt Monster in Loop und kassiert weiter Schaden
	};
};	


// *******
// ZS_Pyro
// *******

func int ZS_Pyro()
{
	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, B_StopPyro);
	
	// ------ Non_interruptable Bodystates stehen sauber auf bzw. beenden sauber
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
		AI_PlayAni (self, "T_STAND_2_LIGHTNING_VICTIM");
	};	
};

func int ZS_Pyro_Loop ()
{	

	if (Npc_GetStateTime(self)>=1)
	{
		Npc_SetStateTime(self,0);
		B_MagicHurtNpc (other, self, SPL_PYRO_DAMAGE_PER_SEC);

		if	(self.attribute[ATR_HITPOINTS] <= 0)
		{
			Npc_ClearAIQueue(self);		
			AI_StandUp		(self);
		
			return			LOOP_END;
		};
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_Pyro_End()
{

};


	


	
