
instance VLK_480_Fellan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fellan"; 
	guild 		= GIL_VLK;
	id 			= 480;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_ShortSword2);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_480;
};

FUNC VOID Rtn_Start_480()
{	
	TA_Repair_Hut		(04,30,08,00,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut		(08,00,12,00,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut		(12,00,16,00,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut		(16,00,20,00,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut		(20,00,01,30,"NW_CITY_PATH_HABOUR_09");
	TA_Sleep			(01,30,04,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};

FUNC VOID Rtn_OhneHammer_480()//wenn Spieler ihm auf's Maul gegeben hat
{	
	TA_Sit_Bench		(06,00,23,00,"NW_CITY_HABOUR_REPAIR_03");
    TA_Sleep			(23,00,06,00,"NW_CITY_HABOUR_HUT_05_BED_01");
};
