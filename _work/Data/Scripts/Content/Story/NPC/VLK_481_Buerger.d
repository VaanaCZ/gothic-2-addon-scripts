
instance VLK_481_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buerger; 
	guild 		= GIL_VLK;
	id 			= 474;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
 	EquipItem (self, ItMw_1h_Vlk_Dagger);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_481;
};

FUNC VOID Rtn_Start_481()
{	
	TA_Cook_Cauldron	(05,05,12,05,"NW_CITY_PATH_HABOUR_13_C");
	TA_Smalltalk		(12,05,15,55,"NW_CITY_HABOUR_SMALLTALK_02");
    TA_Cook_Cauldron	(15,55,20,05,"NW_CITY_PATH_HABOUR_13_C");
    TA_Smalltalk		(20,05,23,55,"NW_CITY_HABOUR_SMALLTALK_02");
    TA_Sleep			(23,55,05,05,"NW_CITY_HABOUR_HUT_06_BED_02");
    
    
    
};
