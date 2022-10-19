// ************************************
// ZS_Circle für Auge Innos Beschwörung
// ************************************


func void ZS_Circle	() 	
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	// ------ PercTime überschreiben ------
	Npc_SetPercTime		(self, 0.3);
	
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP	(self);
};

func int ZS_Circle_Loop ()
{
	var int randy;
	var int randyKDW;
	var int randyKDW_Lightstar;

	if (self.guild == GIL_DMT)
	{
		randy = Hlp_Random (3000);
	
		if (Npc_GetStateTime(self) > randy)
		{
				Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
				Npc_SetStateTime (self, 0);
				Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
				AI_PlayAni (self,"T_PRACTICEMAGIC5");	
		};	
	}
	else if (self.guild == GIL_KDW)//ADDON:  KDW 
	{
		randyKDW = Hlp_Random (2500);
		randyKDW_Lightstar= Hlp_Random (2);
			
		if (Npc_GetStateTime(self) > randyKDW)
			{
				AI_AlignToWP    (self);
				Npc_SetStateTime (self, 0);
				Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
				AI_PlayAni (self,"T_PRACTICEMAGIC5");	
				//Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
				Wld_PlayEffect("spellFX_RingRitual2",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
	
				if (randyKDW_Lightstar == 0)
				{ 
					Wld_PlayEffect("spellFX_RingRitual1",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
				}
				else if (randyKDW_Lightstar == 1)
				{
					Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
				};
			};
	}
	else if (MIS_RitualInnosEyeRepair != LOG_SUCCESS)
	{
		randy = Hlp_Random (1000);

			if (Npc_GetStateTime(self) > randy)
				{
					Npc_SetStateTime (self, 0);
					Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
					AI_PlayAni (self,"T_PRACTICEMAGIC5");	
						
					if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xardas))
					{
						Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
					}
					else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pyrokar))
					{
						Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
					}
					else // Vatras 
					{
						Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
					};
				};	
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Circle_End ()
{

};
