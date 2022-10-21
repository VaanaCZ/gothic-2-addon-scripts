// *****************
// B_StopInflate
// *****************

func void B_RestartInflate()
{
	if (Npc_GetLastHitSpellID(self) == SPL_Inflate)
	{
		Npc_SetStateTime(self,0);
	};
};


func void B_StopInflate()
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
// ZS_Inflate
// **************

func int ZS_Inflate()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartInflate); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden
	
	Npc_StopAni(self, "S_INFLATE_VICTIM");										// falls der NSC am Zappeln ist, brich die Ani ab

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS 		(self, "T_STAND_2_INFLATE_VICTIM", BS_UNCONSCIOUS);
	};
	self.aivar[AIV_InflateStateTime] = 0;
};



func int ZS_Inflate_Loop ()
{	
	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > SPL_TIME_Inflate)
	{
		B_StopInflate();
		return LOOP_END;
	};
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_InflateStateTime])
	{
			 if (Npc_GetStateTime(self) == 1)  {  Mdl_SetModelFatness (self, 1);			}
		else if (Npc_GetStateTime(self) == 2)  {  Mdl_SetModelFatness (self, 3);			}
		else if (Npc_GetStateTime(self) == 3)  {  Mdl_SetModelFatness (self, 8);			}
		else if (Npc_GetStateTime(self) == 4)  {  Mdl_SetModelFatness (self, 12);			}
		else if (Npc_GetStateTime(self) == 5)  {  
			Mdl_SetModelFatness (self, 9);
			B_Say (self, other, "$Aargh_1");
		}
		else if (Npc_GetStateTime(self) == 6)  {  Mdl_SetModelFatness (self, 15);			}
		else if (Npc_GetStateTime(self) == 7)  {  Mdl_SetModelFatness (self, 18);			}
		else if (Npc_GetStateTime(self) == 8)  { 
			Mdl_SetModelFatness (self, 11);	
			B_Say (self, other, "$Aargh_2");
		}
		else if (Npc_GetStateTime(self) == 9)  {  Mdl_SetModelFatness (self, 15);			}
		else if (Npc_GetStateTime(self) == 10)  {  Mdl_SetModelFatness (self,13);		}
		else if (Npc_GetStateTime(self) == 11)  {  Mdl_SetModelFatness (self,12);		}
		else if (Npc_GetStateTime(self) == 12)  {  Mdl_SetModelFatness (self,10);		}
		else if (Npc_GetStateTime(self) == 13)  {  Mdl_SetModelFatness (self, 8);		}
		else if (Npc_GetStateTime(self) == 14)
		{
			Mdl_SetModelFatness (self, 5);
			B_Say (self, other, "$Aargh_3");
		}
		else if (Npc_GetStateTime(self) == 15)  {  Mdl_SetModelFatness (self, 6);		}
		else if (Npc_GetStateTime(self) == 16)  {  Mdl_SetModelFatness (self, 4);		}
		else if (Npc_GetStateTime(self) == 17)  {  Mdl_SetModelFatness (self, 2);		}
		else if (Npc_GetStateTime(self) == 18)  {  Mdl_SetModelFatness (self, 1);		}
		else if (Npc_GetStateTime(self) == 19)  {  Mdl_SetModelFatness (self, 1);		};
		
		 
		self.aivar[AIV_InflateStateTime] = Npc_GetStateTime(self);
	
		// ------ Damage abziehen, aber NICHT sterben (immer mindeststens 1 LE behalten) ------
		if (self.attribute[ATR_HITPOINTS] > SPL_Inflate_DAMAGE)
		{
			
			/*
			
			// feuer wesen erhalten doppelten schaden
			if (self.guild == GIL_FIREGOLEM)
			|| (self.aivar[AIV_MM_REAL_ID]	== 	ID_FIREWARAN)
			|| (self.aivar[AIV_MM_REAL_ID]	== 	ID_DRAGON_FIRE)		
			{
				B_MagicHurtNpc 		(other, self,	SPL_FREEZE_DAMAGE*2);
				return LOOP_CONTINUE;
			};
			
			// eis wesen erhalten halben schaden
			if (self.guild == GIL_ICEGOLEM)
			|| (self.aivar[AIV_MM_REAL_ID]==ID_DRAGON_ICE)
			{
				B_MagicHurtNpc 		(other, self,	SPL_FREEZE_DAMAGE/2);
				return LOOP_CONTINUE;
			};
	
			// rest ganz normal
			
			*/
			
			B_MagicHurtNpc 		(other, self,	SPL_Inflate_DAMAGE);
		}
		else
		{
			
			B_MagicHurtNpc		(other, self, self.attribute[ATR_HITPOINTS] - 1);
		};
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_Inflate_End()
{

};
