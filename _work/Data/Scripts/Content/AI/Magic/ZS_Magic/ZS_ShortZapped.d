// **************************************
// B_StopShortZapped
// -----------------
// wird durch Wahrnehmung AssessStopMagic 
// aus ZS_Zapped aufgerufen
// **************************************

func void B_StopShortZapped()
{	
 	//Npc_PercDisable	(self, PERC_ASSESSSTOPMAGIC); // *** was soll das??? ***
 	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic); //falls in diesem Frame (während des Ausführens des B_) noch ein neuer Spruch wirkt
	
	Npc_ClearAIQueue(self );		// alle AI Befehle entfernen
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


// **********************************
// ZS_ShortZapped
// --------------
// NSC wird von ChargeZap getroffen
// **********************************

func int ZS_ShortZapped()
{
	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, 	B_StopShortZapped);
	
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
		AI_PlayAni			(self, "T_STAND_2_LIGHTNING_VICTIM" );
	};	
};


func int ZS_ShortZapped_Loop ()
{	
	if	(Npc_GetStateTime(self) > SPL_TIME_SHORTZAPPED)	
	{
		B_StopShortZapped();
	};
};


func void ZS_ShortZapped_End()
{

};
