INSTANCE PIR_1364_Addon_PIRAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_PIRAT;
	guild 		= GIL_PIR;
	id 			= 1364;
	voice 		= 6;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 700;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hSword);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dusty, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1364;
};

FUNC VOID Rtn_PreStart_1364 ()
{	
	TA_Roast_Scavenger 	(08,00,20,00,"ADW_PIRATECAMP_SCAVENGER");
	TA_Roast_Scavenger	(20,00,08,00,"ADW_PIRATECAMP_SCAVENGER");
};

FUNC VOID Rtn_Start_1364 ()
{	
	TA_Roast_Scavenger 	(07,35,16,35,"ADW_PIRATECAMP_SCAVENGER");
	TA_Stand_Drinking 	(16,35,17,35,"ADW_PIRATECAMP_BEACH_07");
	TA_Roast_Scavenger 	(17,35,20,35,"ADW_PIRATECAMP_SCAVENGER");
	TA_Stand_Drinking 	(20,35,07,35,"ADW_PIRATECAMP_BEACH_07");
};

FUNC VOID Rtn_Follow_1364 ()
{	
	TA_Follow_Player 	(08,00,20,00,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player	(20,00,08,00,"ADW_CANYON_TELEPORT_PATH_06");
};
