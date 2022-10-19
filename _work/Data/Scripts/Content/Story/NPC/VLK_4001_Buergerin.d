
instance VLK_4001_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 4001;
	voice 		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4001;
};

FUNC VOID Rtn_Start_4001 ()
{	
	TA_Sleep			(21,45,06,30,"NW_CITY_REICH03_BED_02");
	
	TA_Stand_Sweeping	(06,30,08,00,"NW_CITY_UPTOWN_HUT_02_ENTRY");
    TA_Cook_Stove		(08,00,10,00,"NW_CITY_REICH03_COOK");
    TA_Smalltalk		(10,00,14,00,"NW_CITY_UPTOWN_PATH_15_B");
    TA_Sweep_FP			(14,00,15,30,"NW_CITY_UPTOWN_HUT_02_IN");
    TA_Cook_Stove		(15,30,17,00,"NW_CITY_REICH03_COOK");
    TA_Smalltalk		(17,00,21,45,"NW_CITY_UPTOWN_PATH_15_B");
};
