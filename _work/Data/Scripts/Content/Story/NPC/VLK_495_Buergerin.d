
instance VLK_495_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Magd; //Coragons Frau / Magd / Bedienung
	guild 		= GIL_VLK;
	id 			= 495;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_BauBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_495;
};

FUNC VOID Rtn_Start_495 ()
{	
	TA_Smalltalk			(06,00,08,00,"NW_CITY_MERCHANT_PATH_28_B");
    TA_Stand_Eating			(08,00,09,00,"NW_CITY_MERCHANT_PATH_30");
    TA_Smalltalk			(09,00,11,00,"NW_CITY_MERCHANT_PATH_28_B");
    TA_Stand_Eating			(11,00,12,00,"NW_CITY_MERCHANT_PATH_30");
    TA_Smalltalk			(12,00,14,00,"NW_CITY_MERCHANT_PATH_28_B");
    TA_Stand_Eating			(14,00,15,00,"NW_CITY_MERCHANT_PATH_30");
    TA_Smalltalk			(15,00,17,00,"NW_CITY_MERCHANT_PATH_28_B");
    TA_Stand_Eating			(17,00,18,00,"NW_CITY_MERCHANT_PATH_30");
	TA_Cook_Stove 			(18,00,01,00,"TAVERN02");
	TA_Stand_Drinking 		(01,00,05,00,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Sweeping 		(05,00,06,00,"NW_CITY_MERCHANT_TAVERN01_IN");
};
