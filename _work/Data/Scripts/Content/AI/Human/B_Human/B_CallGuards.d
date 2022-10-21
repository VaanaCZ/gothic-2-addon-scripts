// **************************************
// B_CallGuards
// ------------
// wird NUR aus ZS_Attack aufgerufen
// **************************************

// ------------------------------
func int C_WantToCallGuards (var C_NPC slf)
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		if (slf.guild == GIL_PAL)
		|| (slf.guild == GIL_MIL)
		|| (slf.guild == GIL_VLK)
		|| (slf.guild == GIL_SLD)
		|| (slf.guild == GIL_BAU)
		{
			return TRUE;
		};
	};
	
	return FALSE;
};
// ------------------------------

func void B_CallGuards()
{
	//EXIT IF...
	
	if (!C_WantToCallGuards(self))
	{
		return;
	};
	
	
	//FUNC
	
	// ------ ACHTUNG: Wachen-Ketten-Aufrufe! ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)
	|| (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom)
	{
		B_Say_Overlay (self, other, "$ALARM");	//ALARM!
		//Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
		return;
	};		
	
	// ------ Enemy = Mensch oder Monster ODER Mörder ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	|| (self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		if (self.guild == GIL_MIL) 
		|| (self.guild == GIL_PAL)
		|| (self.guild == GIL_SLD)
		{
			B_Say_Overlay (self, other, "$ALARM");					//ALARM!
			Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
			return;
		};
		
		if (!C_NpcIsToughGuy (self))
		{
			B_Say_Overlay (self, other, "$GUARDS");		//WACHE!
			Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
			return;
		};
		
		return;
	};
	
	// ------ GateGuards attackieren Eindringling ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		B_Say_Overlay (self, other, "$ALARM");					//ALARM!
		Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
		return;
	};
	
	// ------ Spieler hat Item geklaut ODER an Mob mit Besitzflag rumgefummelt ------
	if (self.aivar[AIV_ATTACKREASON] == AR_Theft)
	|| (self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		if (!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay (self, other, "$GUARDS");		//WACHE!
			Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
		};
		
		return;
	};
	
	// ------ Täter hat trotz zweimaliger Warnung Waffe nicht weggesteckt ------
	if (self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		if (!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay (self, other, "$GUARDS");		//WACHE!
			Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
		};

		return;
	};
	
	// ------ Spieler ist unbefugt in meinem Raum ------
	if (self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		if (self.guild == GIL_MIL) 
		|| (self.guild == GIL_PAL)
		|| (self.guild == GIL_SLD)
		{
			B_Say_Overlay (self, other, "$ALARM");					//ALARM!
			Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
			return; 
		};
		
		if (!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay (self, other, "$GUARDS");		//WACHE!
			Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
			return; 
		};

		return;
	};
	
	return;
};	



