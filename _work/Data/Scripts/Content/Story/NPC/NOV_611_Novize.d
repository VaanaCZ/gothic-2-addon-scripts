INSTANCE NOV_611_Novize (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_NOV;
	id 			= 611;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_611;
};

FUNC VOID Rtn_Start_611 ()
{	
	TA_Pray_Innos_FP	(08,00,09,00,"NW_MONASTERY_CHURCH_03");
    TA_Smalltalk		(09,00,23,05,"NW_MONASTERY_GRASS_01");
    TA_Sleep			(23,05,08,00,"NW_MONASTERY_NOVICE02_04");
};
FUNC VOID Rtn_Fegen_611 ()
{	
	TA_Stand_Sweeping	(08,00,23,05,"NW_MONASTERY_NOVICE01_02");
    TA_Stand_Sweeping	(23,05,08,00,"NW_MONASTERY_NOVICE01_02");
};



