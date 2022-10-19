
instance VLK_432_Moe (Npc_Default)
{
	// ------ NSC ------
	name 		= "Moe"; 
	guild 		= GIL_NONE;
	id 			= 432;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Scar, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_432;
};

FUNC VOID Rtn_Start_432()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_PATH_HABOUR_02_02");
    TA_Stand_Guarding	(23,00,08,00,"NW_CITY_PATH_HABOUR_02_02");
};
