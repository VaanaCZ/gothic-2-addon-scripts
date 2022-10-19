INSTANCE NOV_601_Igaraz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Igaraz";
	guild 		= GIL_NOV;
	id 			= 601;
	voice 		= 13;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Nov_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_IgarazChest_mis, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Normal_Stone, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_601;
};

FUNC VOID Rtn_Start_601()
{	
	TA_Smalltalk		(09,00,22,04,"NW_MONASTERY_GRASS_01");
    TA_Sleep			(22,04,08,00,"NW_MONASTERY_NOVICE02_05");
    TA_Pray_Innos_FP	(08,00,09,00,"NW_MONASTERY_CHURCH_03");
};
FUNC VOID Rtn_CONTEST_601() 
{	
	TA_Stand_ArmsCrossed	(08,00,23,04,"NW_TAVERNE_TROLLAREA_05"); 
    TA_Stand_ArmsCrossed	(23,04,08,00,"NW_TAVERNE_TROLLAREA_05");
};
FUNC VOID Rtn_CONTESTWAIT_601() 
{	
	TA_Stand_ArmsCrossed	(08,00,23,04,"NW_TAVERNE_TROLLAREA_66"); 
    TA_Stand_ArmsCrossed	(23,04,08,00,"NW_TAVERNE_TROLLAREA_66");
};







