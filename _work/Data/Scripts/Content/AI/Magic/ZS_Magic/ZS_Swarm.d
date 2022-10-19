// *****************
// B_StopSwarm
// *****************

func void B_RestartSwarm()
{
	if (Npc_GetLastHitSpellID(self) == SPL_Swarm)
	{
		Npc_SetStateTime(self,0);
	};
};


func void B_StopSwarm()
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
// ZS_Swarm
// **************

func int ZS_Swarm()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartSwarm); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden
	
	Npc_StopAni(self, "S_SWARM_VICTIM");										// falls der NSC am Zappeln ist, brich die Ani ab

	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS 		(self, "T_STAND_2_SWARM_VICTIM", BS_UNCONSCIOUS);
	};
	self.aivar[AIV_SwarmStateTime] = 0;
};



func int ZS_Swarm_Loop ()
{	
	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > SPL_TIME_Swarm)
	{
		B_StopSwarm();
		return LOOP_END;
	};
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_SwarmStateTime])
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
		
		 
		self.aivar[AIV_SwarmStateTime] = Npc_GetStateTime(self);
	
		// ------ Damage abziehen, aber NICHT sterben (immer mindeststens 1 LE behalten) ------
		if (self.attribute[ATR_HITPOINTS] > SPL_Swarm_DAMAGE)
		{
			
			/*
			
			// feuer wesen erhalten doppelten schaden
			if (self.guild == GIL_FIREGOLEM)
			|| (self.aivar[AIV_MM_REAL_ID]	== 	ID_FIREWARAN)
			|| (self.aivar[AIV_MM_REAL_ID]	== 	ID_DRAGON_FIRE)		
			{
				B_MagicHurtNpc 		(other, self, SPL_FREEZE_DAMAGE*2);
				return LOOP_CONTINUE;
			};
			
			// eis wesen erhalten halben schaden
			if (self.guild == GIL_ICEGOLEM)
			|| (self.aivar[AIV_MM_REAL_ID]==ID_DRAGON_ICE)
			{
				B_MagicHurtNpc 		(other, self, SPL_FREEZE_DAMAGE/2);
				return LOOP_CONTINUE;
			};
	
			// rest ganz normal
			
			*/
			
			B_MagicHurtNpc 		(other,	self, SPL_Swarm_DAMAGE);
		}
		else
		{
			
			B_MagicHurtNpc		(other, self, self.attribute[ATR_HITPOINTS] - 1);
		};
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_Swarm_End()
{

};
