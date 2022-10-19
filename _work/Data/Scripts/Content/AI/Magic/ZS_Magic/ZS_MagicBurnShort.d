// *****************************************************
// B_MagicStopBurn
// ----------
// wird aufgerufen durch PERC_ASSESSSTOPMAGIC in ZS_MagicBurn
// *****************************************************

const int SPL_MAGICBURNSHORT_DAMAGE_PER_SEC = 1;

func void B_StopMagicBurnShort()
{	
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic); //falls in diesem Frame (während des Ausführens des B_) noch ein neuer Spruch wirkt
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine	(self); //Sicherheitshalber, falls B_AssessDamage NICHT in neuen ZS weiterleitet (kann z.ZT. aber nicht passieren) 							// - sonst würde NPC in Loop hängenbleiben
	}
	else
	{
		Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
		AI_ContinueRoutine	(self); //sonst bleibt Monster in Loop und kassiert weiter Schaden
	};
	
	// sicherheitshalber den Effekt beenden (kann evtl. hier auch schon aus sein, je nach PFX/Logik)
	//AI_StopFX(self, "VOB_BURN");
};	



// *****************
// ZS_MagicBurnShort
// *****************

func void B_RestartBurnShort()
{
	if (Npc_GetLastHitSpellID(self) == SPL_ChargeFireball)
	|| (Npc_GetLastHitSpellID(self) == SPL_Firestorm)			
	{
		Npc_SetStateTime(self,0);
		return;
	};
	
	if (Npc_GetLastHitSpellID(self) == SPL_IceWave)
	|| (Npc_GetLastHitSpellID(self) == SPL_IceCube)
	{
		// nun, das ist krass, hier muss dann der ZS_Magicburn beendet werden, und der ZS_MagicFreeze gestartet werden
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);								//schaltet alle Wahrnehmungen ab - so kann keine später priorisierte diesen Stateaufruf verhindern (s. z.B. AssessFightSound + AssessDamage)
		AI_StartState		(self, ZS_MagicFreeze, 0, "");
	};
};


func int ZS_MagicBurnShort()
{
	// ein PERC_ASSESSSTOPMAGIC beendet evtl. den ZS, kann im Loop aber auch manuell geschehen
	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, B_StopMagicBurnShort); 
	
	// ------ Non_interruptable Bodystates stehen sauber auf bzw. beenden sauber
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
	
	// keine fire victim ani für nur kurz getroffen
	// kann hier aber trotzdem jederzeit aktiviert werden (mit allen damit verbundenen balancing probs);
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		Npc_PlayAni (self, "S_FIRE_VICTIM");
	};
	
};

func int ZS_MagicBurnShort_Loop ()
{	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartBurnShort);// falls ein NSC nochmal von einem Firespell getroffen wurde, so muss die State Time reseted werden

	// evtl. kann man hier auch den aktuellen Spell Level holen, und dann mehr Schaden verabreichen.
	// allerdings brennt ein höher gecasteter Firespell auch länger und zieht somit sowieso mehr Schaden ab.
	if (Npc_GetStateTime(self) == 1)
	{
		Npc_SetStateTime(self,0);
		B_MagicHurtNpc (other, self, SPL_MAGICBURNSHORT_DAMAGE_PER_SEC);
		Npc_ClearAIQueue(self);		
		AI_StandUp		(self);				// FIXME: wieso ? dann steht er doch noch mal auf bevor er abkratzt		
		return			LOOP_END;
	};
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		Npc_PlayAni (self, "S_FIRE_VICTIM");
	};
	if	(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);		
		AI_StandUp		(self);				// FIXME: wieso ? dann steht er doch noch mal auf bevor er abkratzt
											// (dann sollte er auch noch sowas sagen wie: "Macht das nicht zu Hause Kinder" bevor er endgültig stirbt :)												
		return			LOOP_END;
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_MagicBurnShort_End()
{
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);
};


	


	
