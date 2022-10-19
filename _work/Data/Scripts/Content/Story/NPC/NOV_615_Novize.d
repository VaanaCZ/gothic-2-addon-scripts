INSTANCE NOV_615_Novize (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_NOV;
	id 			= 615;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_615;
};
FUNC VOID Rtn_Start_615 ()
{	
	TA_Stand_Sweeping	(08,00,15,00,"NW_MONASTERY_CELLAR_08");
    TA_Pray_Innos_FP	(15,00,16,00,"NW_MONASTERY_CHURCH_03");
    TA_Stand_Sweeping	(16,00,22,00,"NW_MONASTERY_CELLAR_08");
    TA_Sleep			(22,00,08,00,"NW_MONASTERY_NOVICE04_04");
    
};
FUNC VOID Rtn_Fegen_615 ()
{	
	TA_Stand_Sweeping	(08,00,22,00,"NW_MONASTERY_NOVICE03_02");
    TA_Stand_Sweeping	(22,00,08,00,"NW_MONASTERY_NOVICE03_02");
};
