INSTANCE NOV_603_Agon (Npc_Default)
{
	// ------ NSC ------
	name 		= "Agon";
	guild 		= GIL_NOV;
	id 			= 603;
	voice 		= 7;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal01, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_603;
};

FUNC VOID Rtn_Start_603()
{	
	TA_Rake_FP 			(08,00,09,00,"NW_MONASTERY_HERB_05");
    TA_Pray_Innos_FP	(09,00,10,00,"NW_MONASTERY_CHURCH_03");
    TA_Rake_FP 			(10,00,22,10,"NW_MONASTERY_HERB_05");
    TA_Sleep			(22,10,08,00,"NW_MONASTERY_NOVICE03_07");
	
	
};

FUNC VOID Rtn_GolemLives_603()
{	
	TA_Stand_Guarding 		(08,00,23,10,"NW_TROLLAREA_PATH_02");
    TA_Stand_Guarding		(23,10,08,00,"NW_TROLLAREA_PATH_02");
};

FUNC VOID Rtn_GolemDead_603()
{	
	TA_Stand_Guarding 		(08,00,23,10,"NW_MAGECAVE_RUNE");
    TA_Stand_Guarding		(23,10,08,00,"NW_MAGECAVE_RUNE");
};

//Falls der Spieler Agon nicht umgebracht hat

FUNC VOID Rtn_StillAlive_603 ()	
{
	TA_Stand_Guarding 		(08,00,23,10,"TAVERN");
    TA_Stand_Guarding		(23,10,08,00,"TAVERN");
};
