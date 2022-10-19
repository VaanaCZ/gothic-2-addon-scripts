INSTANCE NOV_612_Babo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Babo";
	guild 		= GIL_NOV;
	id 			= 612;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 															
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMw_1h_Nov_Mace,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal07, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_612;
};

FUNC VOID Rtn_Start_612 ()
{	
	TA_Stand_Sweeping	(08,00,14,00,"NW_MONASTERY_CORRIDOR_10");
	TA_Pray_Innos_FP	(14,00,15,00,"NW_MONASTERY_CHURCH_03");
    TA_Stand_Sweeping	(15,00,23,30,"NW_MONASTERY_CORRIDOR_10");
    TA_Sleep			(23,30,08,00,"NW_MONASTERY_NOVICE04_05");
};
FUNC VOID Rtn_Train_612 ()
{	
    TA_Sleep			(23,30,05,00,"NW_MONASTERY_NOVICE04_05");
	TA_Practice_Sword	(05,00,07,00,"NW_MONASTERY_TRAIN_02");
	TA_Stand_Sweeping	(07,00,14,00,"NW_MONASTERY_CORRIDOR_10");
	TA_Pray_Innos_FP	(14,00,15,00,"NW_MONASTERY_CHURCH_03");
    TA_Stand_Sweeping	(15,00,23,30,"NW_MONASTERY_CORRIDOR_10");
};
FUNC VOID Rtn_Fegen_612 ()
{	
	TA_Stand_Sweeping	(08,00,23,30,"NW_MONASTERY_NOVICE04_02");
    TA_Stand_Sweeping	(23,30,08,00,"NW_MONASTERY_NOVICE04_02");
};
FUNC VOID Rtn_Favour_612 ()
{	
	TA_Rake_FP			(08,00,23,30,"NW_MONASTERY_HERB_05");
    TA_Sleep			(23,30,08,00,"NW_MONASTERY_NOVICE04_05");
};
