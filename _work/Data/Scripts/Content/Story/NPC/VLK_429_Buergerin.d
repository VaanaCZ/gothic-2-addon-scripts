
instance VLK_429_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	//Carls Frau
	guild 		= GIL_VLK;
	id 			= 429;
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
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_429;
};

FUNC VOID Rtn_Start_429 ()
{	
	TA_Smalltalk		(05,05,12,05,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
    TA_Stomp_Herb 		(12,05,22,05,"NW_CITY_HABOUR_POOR_AREA_PATH_08_A");
    TA_Smalltalk		(22,05,00,05,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
    TA_Sleep			(00,05,05,05,"NW_CITY_HABOUR_HUT_03_BED_01");
};
