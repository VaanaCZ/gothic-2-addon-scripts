INSTANCE KDF_510_Hyglas (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hyglas";
	guild 		= GIL_KDF;
	id 			= 510;
	voice 		= 14;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief",Face_N_NormalBart09, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_510;
};

FUNC VOID Rtn_Start_510 ()
{	
	TA_Read_Bookstand	(08,00,23,00,"NW_MONASTERY_RUNEMAKER_08");
    TA_Read_Bookstand	(23,00,08,00,"NW_MONASTERY_RUNEMAKER_08");
};
