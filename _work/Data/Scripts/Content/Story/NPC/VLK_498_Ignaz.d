
instance VLK_498_Ignaz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ignaz"; 
	guild 		= GIL_VLK;
	id 			= 498;
	voice 		= 14;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Axe); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Corristo, BodyTex_N, ITAR_Smith);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_498;
};

FUNC VOID Rtn_Start_498()
{	
	TA_Potion_Alchemy	(05,00,10,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Read_Bookstand 	(10,00,13,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sit_Chair 	 	(13,00,14,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Potion_Alchemy	(14,00,19,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Read_Bookstand 	(19,00,23,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sit_Chair 	 	(23,00,00,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sleep			(00,00,05,00,"NW_CITY_HABOUR_POOR_AREA_HUT_08_IN_BED");
};
