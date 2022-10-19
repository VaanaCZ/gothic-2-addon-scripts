
instance VLK_486_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin; //Zuris Frau
	guild 		= GIL_VLK;
	id 			= 486;
	voice 		= 17;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_486;
};

FUNC VOID Rtn_Start_486 ()
{	
	TA_Stand_ArmsCrossed 	(05,30,06,00,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Smalltalk			(06,00,08,00,"NW_CITY_MERCHANT_PATH_36_B");
    TA_Stand_ArmsCrossed	(08,00,09,00,"NW_CITY_MERCHANT_PATH_36_B");
    TA_Smalltalk			(09,00,11,00,"NW_CITY_MERCHANT_PATH_36_B");
    TA_Stand_ArmsCrossed	(11,00,12,00,"NW_CITY_MERCHANT_PATH_36_B");
    TA_Smalltalk			(12,00,14,00,"NW_CITY_MERCHANT_PATH_36_B");
    TA_Stand_ArmsCrossed	(14,00,15,00,"NW_CITY_MERCHANT_PATH_36_B");
    TA_Smalltalk			(15,00,17,00,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_ArmsCrossed	(17,00,17,30,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Cook_Stove			(17,30,20,00,"NW_CITY_ZURIS_FRAU_COOK");
	TA_Sit_Chair 			(20,00,23,30,"NW_CITY_MERCHANT_HUT_02_IN_02");
	TA_Sleep				(23,30,05,30,"NW_CITY_BED_ZURIS_FRAU");
};
