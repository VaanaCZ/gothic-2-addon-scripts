
instance VLK_411_Gaertner (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ogrodnik";
	guild 		= GIL_VLK;
	id 			= 411;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	//Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_NormalBart_Graham, BodyTex_N, ITAR_BAU_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_411;
};

FUNC VOID Rtn_Start_411 ()
{
	TA_Rake_FP		  (06,30,08,30,"NW_CITY_CITYHALL_04");
	TA_Rake_FP		  (08,30,10,30,"NW_CITY_CITYHALL_10");
	TA_Rake_FP	   	  (10,30,12,30,"NW_CITY_CITYHALL_12");	
    TA_Rake_FP		  (12,30,14,30,"NW_CITY_CITYHALL_07");
    TA_Rake_FP		  (14,30,16,30,"NW_CITY_CITYHALL_10");
	TA_Rake_FP	   	  (16,30,18,30,"NW_CITY_CITYHALL_12");	
    TA_Rake_FP		  (18,30,20,30,"NW_CITY_CITYHALL_07");
    TA_Rake_FP		  (20,30,22,00,"NW_CITY_CITYHALL_04");
   
    TA_Sit_Campfire	  (22,00,06,30,"NW_CITY_CITYHALL_04_B");
};
