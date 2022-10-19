instance BDT_1013_Bandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT; 
	guild 		= GIL_BDT;
	id 			= 1013;
	voice 		= 1;
	flags       = 0;			
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------		
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItWr_Poster_MIS,1);
	//CreateInvItems (self, ItWr_BanditLetter_MIS,1);
		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",  Face_N_Homer, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------						
	B_SetFightSkills (self, 10);
	
	// ------ TA ------
	daily_routine 	= RTN_Start_1013;
};

FUNC VOID RTN_Start_1013()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"NW_XARDAS_STAIRS_01");  
	TA_Stand_ArmsCrossed (12,00,00,00,"NW_XARDAS_STAIRS_01");
};

FUNC VOID RTN_Ambush_1013()
{
	TA_Guide_Player (00,00,12,00,"NW_XARDAS_BANDITS_RIGHT");  
	TA_Guide_Player (12,00,00,00,"NW_XARDAS_BANDITS_RIGHT"); //_05
};

FUNC VOID RTN_AWAY_1013()
{
	TA_Sit_Campfire (00,00,12,00,"NW_XARDAS_GOBBO_02");  
	TA_Sit_Campfire (12,00,00,00,"NW_XARDAS_GOBBO_02");
};

func VOID RTN_AWAY2_1013()
{
	TA_FleeToWP (00,00,12,00,"NW_XARDAS_MONSTER_INSERT_01");
	TA_FleeToWP (12,00,00,00,"NW_XARDAS_MONSTER_INSERT_01");
};




