
instance DMT_1210_Dementor (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Dementor;	
	guild 		= GIL_DMT;
	id 			= 1210;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_Dementor);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1210;
};

FUNC VOID Rtn_Start_1210 ()
{	
	TA_Stand_Dementor	(08,00,23,00,"NW_TROLLAREA_RITUAL_11");
    TA_Stand_Dementor	(23,00,08,00,"NW_TROLLAREA_RITUAL_11");
};

FUNC VOID Rtn_AfterRitual_1210 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(07,00,08,00,"NW_TROLLAREA_PATH_76");
	TA_Stand_Dementor	(08,00,09,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(09,00,10,00,"NW_TROLLAREA_PATH_76");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(11,00,12,00,"NW_TROLLAREA_PATH_76");
	TA_Stand_Dementor	(12,00,13,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(13,00,14,00,"NW_TROLLAREA_PATH_76");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(15,00,16,00,"NW_TROLLAREA_PATH_76");
	TA_Stand_Dementor	(16,00,17,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(17,00,18,00,"NW_TROLLAREA_PATH_76");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(19,00,20,00,"NW_TROLLAREA_PATH_76");
	TA_Stand_Dementor	(20,00,21,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(21,00,22,00,"NW_TROLLAREA_PATH_76");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(23,00,00,00,"NW_TROLLAREA_PATH_76");
	TA_Stand_Dementor	(00,00,01,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(01,00,02,00,"NW_TROLLAREA_PATH_76");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(03,00,04,00,"NW_TROLLAREA_PATH_76");
	TA_Stand_Dementor	(04,00,05,00,"NW_TROLLAREA_PATH_04");
	TA_Stand_Dementor	(05,00,06,00,"NW_TROLLAREA_PATH_76");
};
