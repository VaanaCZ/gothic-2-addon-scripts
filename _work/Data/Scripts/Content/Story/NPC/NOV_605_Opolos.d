INSTANCE NOV_605_Opolos (Npc_Default)
{
	// ------ NSC ------
	name 		= "Opolos";
	guild 		= GIL_NOV;
	id 			= 605;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Tough_Silas, BodyTex_B, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_605;
};

FUNC VOID Rtn_Start_605()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_MONASTERY_SHEEP_05");
    TA_Stand_Guarding	(23,00,08,00,"NW_MONASTERY_SHEEP_05");
};

FUNC VOID Rtn_Favour_605()
{	
	TA_Read_Bookstand	(08,00,23,00,"NW_MONASTERY_RUNEMAKER_07");
    TA_Read_Bookstand	(23,00,08,00,"NW_MONASTERY_RUNEMAKER_07");
};
