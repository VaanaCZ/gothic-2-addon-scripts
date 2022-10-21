// ***********************************************
// B_RefreshAtInsert
// -----------------
// Funktion wird von der Engine aufgerufen
// und zwar für jedem NSC (auch Monster), 
// die in die "Darstellungsglocke" kommen
// self ist hier immr der jeweils abgehandelte NSC
// ***********************************************

func void B_RefreshAtInsert()
{
	// EXIT IF...
	
	// ------ Tote = Exit ------
	if (self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};
		
	// FUNC
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	// ------ Nur für Humans -----
	if (self.guild < GIL_SEPERATOR_HUM)
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her))
	{
		// ------ LE wieder auf MAX ------
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		
		// ------ Game-Engine equippt automatisch die besten Waffen NACHDEM diese Funktion aufgerufen wird ------
		if 	(Npc_HasEquippedWeapon(self) == FALSE) //NK- ODER FK-Waffe
		{
			if (self.guild == GIL_MIL)	
			{
				CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			};
			
			if (self.guild == GIL_PAL)	
			{	
				CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			};
			
			if (self.guild == GIL_SLD)	
			{	
				CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			};
			
			if (self.guild == GIL_BAU)
			{	
				CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			};
			
			if (self.guild == GIL_NOV)
			{	
				CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			};
		};
	};
};
