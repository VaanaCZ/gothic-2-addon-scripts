instance BDT_10020_Addon_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Guard;
	guild 		= GIL_BDT;
	id 			= 10020;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_BL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart21, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10020;
};
FUNC VOID Rtn_Start_10020()
{
	TA_Stand_Guarding (00,00,01,00,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding (01,00,02,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP		  (02,00,03,00,"BL_UP_PLACE_06");
	TA_Stand_WP		  (03,00,04,00,"BL_UP_CHECK");
	
	TA_Stand_Guarding (04,00,05,00,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding (05,00,06,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP		  (06,00,07,00,"BL_UP_PLACE_06");
	TA_Stand_WP		  (07,00,08,00,"BL_UP_CHECK");
	
	TA_Stand_Guarding (08,00,09,00,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding (09,00,10,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP		  (10,00,11,00,"BL_UP_PLACE_06");
	TA_Stand_WP		  (11,00,12,00,"BL_UP_CHECK");
	
	TA_Stand_Guarding (12,00,13,00,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding (13,00,14,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP		  (14,00,15,00,"BL_UP_PLACE_06");
	TA_Stand_WP		  (15,00,16,00,"BL_UP_CHECK");
	
	TA_Stand_Guarding (16,00,17,00,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding (17,00,18,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP		  (18,00,19,00,"BL_UP_PLACE_06");
	TA_Stand_WP		  (19,00,20,00,"BL_UP_CHECK");
	
	TA_Stand_Guarding (20,00,21,00,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding (21,00,22,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP		  (22,00,23,00,"BL_UP_PLACE_06");
	TA_Stand_WP		  (23,00,00,00,"BL_UP_CHECK");
	
	
	
	
};


