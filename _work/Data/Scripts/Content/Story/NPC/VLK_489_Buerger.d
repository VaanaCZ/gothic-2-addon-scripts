
instance VLK_489_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buerger; 
	guild 		= GIL_VLK;
	id 			= 489;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal14, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_489;
};

FUNC VOID Rtn_Start_489()
{	
	TA_Smoke_Joint			(11,20,19,15,"NW_CITY_WATCH_FIGHT_02");
    TA_Stand_Drinking 		(19,15,02,30,"NW_CITY_HABOUR_03");
    TA_Pee					(21,00,21,05,"NW_CITY_HABOUR_PUFF_02_01");
    TA_Stand_Drinking 		(21,05,02,30,"NW_CITY_HABOUR_03");
    TA_Stand_Drinking 		(02,30,05,20,"NW_CITY_HABOUR_PUFF_IN_07");
    TA_Smoke_Joint	 		(05,20,11,20,"NW_CITY_PATH_HABOUR_01"); 
};
