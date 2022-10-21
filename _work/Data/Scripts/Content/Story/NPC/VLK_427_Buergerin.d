
instance VLK_427_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 427;
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
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_427;
};

FUNC VOID Rtn_Start_427 ()
{	
	TA_Cook_Stove			(04,30,12,00, "NW_CITY_MERCHANT_SHOP01_IN_03_B");
	TA_Stand_Sweeping 		(12,00,13,02, "NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	TA_Smalltalk			(13,02,14,05, "NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	TA_Cook_Stove			(14,05,16,00, "NW_CITY_MERCHANT_SHOP01_IN_03_B");
	TA_Stand_Sweeping		(16,00,17,02, "NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	TA_Smalltalk			(17,02,18,05, "NW_CITY_MERCHANT_SHOP01_FRONT_03_E");
	TA_Cook_Stove			(18,05,20,00, "NW_CITY_MERCHANT_SHOP01_IN_03_B");
	TA_Sit_Chair			(20,00,23,30, "NW_CITY_MERCHANT_SHOP01_IN_01");
    TA_Sleep				(23,30,04,30, "NW_CITY_MERCHANT_SHOP01_IN_01");
};
