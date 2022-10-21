
instance VLK_466_Gernod (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER;
	guild 		= GIL_VLK;
	id 			= 466;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Ulbert, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_466;
};

FUNC VOID Rtn_Start_466()
{	
	TA_Sit_Bench		(06,05,15,00,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Stand_Drinking	(15,00,18,00,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Sit_Bench		(18,00,21,00,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Stand_Drinking	(21,00,01,10,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Sleep			(01,10,06,05,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
    
};
