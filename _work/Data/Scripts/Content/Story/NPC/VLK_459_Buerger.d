
instance VLK_459_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_VLK;
	id 			= 459;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Mace); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_459;
};

FUNC VOID Rtn_Start_459()
{	
	TA_Smalltalk		(05,30,11,35,"NW_CITY_HABOUR_06");
	TA_Stand_Drinking 	(11,35,13,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Smalltalk		(13,30,17,35,"NW_CITY_HABOUR_04");
	TA_Stand_Drinking	(17,35,19,10,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Smalltalk		(19,10,00,00,"NW_CITY_HABOUR_TAVERN01_06");
	TA_Stand_Drinking	(00,00,02,00,"NW_CITY_HABOUR_TAVERN01_01");
    TA_Sleep			(02,00,05,30,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_02");
};
