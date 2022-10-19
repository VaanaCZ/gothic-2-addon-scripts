INSTANCE PIR_1351_Addon_Samuel (Npc_Default)
{
	// ------ NSC ------
	name 		= "Samuel";
	guild 		= GIL_PIR;
	id 			= 1351;
	voice 		= 14;
	flags       = FALSE;											
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Mace_L_03);
	
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBAld", Face_B_Saturas, BodyTex_B, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1351;
};

FUNC VOID Rtn_Start_1351 ()
{	
	TA_Potion_Alchemy	(06,00,08,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(08,00,10,00,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy	(10,00,12,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(12,00,14,00,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy	(14,00,16,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(16,00,18,00,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy	(18,00,20,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(20,00,22,00,"ADW_PIRATECAMP_CAVE1_02");

	TA_Potion_Alchemy	(22,00,06,00,"ADW_PIRATECAMP_CAVE1_04");
};
