
instance VLK_4303_Addon_Erol (Npc_Default)
{
	// ------ NSC ------
	name 		= "Erol";
	guild 		= GIL_NONE;
	id 			= 4303;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_VLK_Sword);
	CreateInvItems (self, ItPo_Health_01, 3);									
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Corristo , BodyTex_N, ITAR_VLK_L);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_4303;
};

FUNC VOID Rtn_PreStart_4303 ()
{	
	TA_Sit_Bench	(08,00,22,00,"NW_TAVERN_TO_FOREST_03");
    TA_Sit_Bench	(22,00,08,00,"NW_TAVERN_TO_FOREST_03");
};

FUNC VOID Rtn_Start_4303 ()
{	
	TA_RangerMeeting	(08,00,22,00,"NW_BIGFARM_HUT_02");
    TA_RangerMeeting	(22,00,08,00,"NW_BIGFARM_HUT_02");
};

FUNC VOID Rtn_Home_4303 ()
{	
	TA_Sit_Chair	(08,00,22,00,"NW_BIGFARM_HUT_IN_01");
    TA_Sleep		(22,00,08,00,"NW_BIGFARM_HUTINSIDE_BED");
};


