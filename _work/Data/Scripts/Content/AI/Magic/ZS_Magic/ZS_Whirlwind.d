// *****************
// B_StopWhirlwind
// *****************

func void B_RestartWhirlwind()
{
	if (Npc_GetLastHitSpellID(self) == SPL_Whirlwind)
	{
		Npc_SetStateTime(self,0);
	};
};


func void B_StopWhirlwind()
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
// ZS_Whirlwind
// **************

func int ZS_Whirlwind()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartWhirlwind); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden
	
	
	
	Npc_StopAni(self, "S_WHIRLWIND_VICTIM");										// falls der NSC am Zappeln ist, brich die Ani ab

	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS 		(self, "T_STAND_2_WHIRLWIND_VICTIM", BS_UNCONSCIOUS);
	};
	self.aivar[AIV_WhirlwindStateTime] = 0;
};



func int ZS_Whirlwind_Loop ()
{	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > SPL_TIME_WHIRLWIND)
	{
		B_StopWhirlwind();
		return LOOP_END;
	};
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_WhirlwindStateTime])
	{
		self.aivar[AIV_WhirlwindStateTime] = Npc_GetStateTime(self);
	
		// ------ Damage abziehen, aber NICHT sterben (immer mindeststens 1 LE behalten) ------
		if (self.attribute[ATR_HITPOINTS] > SPL_Whirlwind_DAMAGE)
		{
			
			
			B_MagicHurtNpc 		(other,	self, SPL_Whirlwind_DAMAGE);
		}
		else
		{
			
			B_MagicHurtNpc		(other, self, self.attribute[ATR_HITPOINTS] - 1);
		};
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_Whirlwind_End()
{

};
