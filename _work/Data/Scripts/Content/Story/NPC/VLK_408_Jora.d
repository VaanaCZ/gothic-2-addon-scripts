
instance VLK_408_Jora (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jora";
	guild 		= GIL_VLK;
	id 			= 408;
	voice 		= 8;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_AlriksSword_Mis); //WICHTIG
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_408;
};

FUNC VOID Rtn_Start_408 ()
{
	TA_Stand_ArmsCrossed	(05,15,20,04,"NW_CITY_MERCHANT_PATH_38");
    TA_Smalltalk		 	(20,04,00,06,"NW_CITY_BEER_06");
    TA_Sleep		 		(00,06,05,15,"NW_CITY_HOTEL_BED_03");
};
