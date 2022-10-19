
instance VLK_488_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;
	guild 		= GIL_VLK;
	id 			= 488;
	voice 		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Vlk_Dagger);
		
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_BauBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_488;
};

FUNC VOID Rtn_Start_488 ()
{	
	TA_Cook_Stove	(05,00,08,00,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Smalltalk	(08,00,12,00,"NW_CITY_PATH_HABOUR_04");
	TA_Stand_Eating	(12,00,14,00,"NW_CITY_PATH_HABOUR_03");
	TA_Sweep_FP		(14,00,16,00,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Stand_Eating	(16,00,18,00,"NW_CITY_PATH_HABOUR_03");
	TA_Cook_Stove	(18,00,20,00,"NW_CITY_HABOUR_HUT_08_IN_B");
	TA_Sweep_FP		(20,00,00,00,"NW_CITY_HABOUR_HUT_08_IN_B");
    TA_Sleep		(00,00,05,00,"NW_CITY_HABOUR_HUT_08_BED_01");
};

