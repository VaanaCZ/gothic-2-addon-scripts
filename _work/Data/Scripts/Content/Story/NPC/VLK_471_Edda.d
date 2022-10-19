
instance VLK_471_Edda (Npc_Default)
{
	// ------ NSC ------
	name 		= "Edda";	
	guild 		= GIL_VLK;
	id 			= 471;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe.", FaceBabe_B_RedLocks, BodyTex_B, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_471;
};

FUNC VOID Rtn_Start_471 ()
{	
	TA_Cook_Cauldron (08,00,22,00,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
    TA_Cook_Cauldron (22,00,08,00,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};
