
instance VLK_476_Fenia (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fenia";	//Halvors Frau
	guild 		= GIL_VLK;
	id 			= 476;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_476;
};

FUNC VOID Rtn_Start_476 ()
{	
	TA_Stand_Guarding		(04,55,20,05,"NW_CITY_PATH_HABOUR_03_01");
    TA_Stomp_Herb 			(20,05,22,05,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
    TA_Sleep	 			(22,05,04,55,"NW_CITY_BED_HALVOR_WEIB");
};
