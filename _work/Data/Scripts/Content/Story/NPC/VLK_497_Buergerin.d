instance VLK_497_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;
	guild 		= GIL_VLK;
	id 			= 497;
	voice 		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Vlk_Dagger);
	// ------ visuals ------																						
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_497;
};

FUNC VOID Rtn_Start_497 ()
{	
	TA_Stand_Eating			(05,00,06,00,"NW_CITY_MERCHANT_PATH_28_E");
	TA_Smalltalk			(06,00,07,00,"MARKT_02");
	TA_Stand_Eating			(07,00,08,00,"NW_CITY_MERCHANT_PATH_28_E");
    TA_Smalltalk			(08,00,10,00,"MARKT_02");
    TA_Stand_ArmsCrossed	(10,00,11,00,"MARKT");
    TA_Smalltalk			(11,00,13,00,"MARKT_02");
	TA_Stand_Eating			(13,00,14,00,"NW_CITY_MERCHANT_PATH_28_E");
    TA_Smalltalk			(14,00,16,00,"MARKT_02");
    TA_Stand_ArmsCrossed	(16,00,17,00,"MARKT");
    
    TA_Cook_Stove			(17,00,18,00,"NW_CITY_UPTOWN_HUT_01_COOK");
    TA_Sweep_FP				(18,00,19,00,"NW_CITY_UPTOWN_HUT_01_COOK");
    TA_Smalltalk			(19,00,22,00,"NW_CITY_UPTOWN_PATH_08");
    TA_Sleep				(22,00,05,00,"NW_CITY_GERBRANDT_BED_02");
};

FUNC VOID Rtn_NewLife_497 ()		
{	
	TA_Smalltalk	(22,00,08,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk	(08,00,11,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
    TA_Smalltalk 	(11,00,15,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
    TA_Smalltalk	(15,00,18,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk 	(18,00,22,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
};
