
instance VLK_485_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 485;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_485;
};

FUNC VOID Rtn_Start_485 ()
{	
	TA_Sit_Bench			(05,10,10,10,"NW_CITY_HABOUR_BENCH_02");
	TA_Stand_Sweeping		(10,10,12,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_IN");
	TA_Stomp_Herb 			(12,10,16,05,"NW_CITY_HABOUR_POOR_AREA_PATH_06_B");
	TA_Smalltalk			(16,05,19,05,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
    TA_Sit_Bench			(19,05,22,55,"NW_CITY_HABOUR_BENCH_02");
    TA_Sleep				(22,55,05,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};
