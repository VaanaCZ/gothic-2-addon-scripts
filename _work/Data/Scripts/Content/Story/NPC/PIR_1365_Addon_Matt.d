INSTANCE PIR_1365_Addon_Matt (Npc_Default)
{
	// ------ NSC ------
	name 		= "Matt";
	guild 		= GIL_PIR;
	id 			= 1365;
	voice 		= 10;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 500;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal14, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1365;
};

FUNC VOID Rtn_Start_1365 ()
{	
	TA_Smalltalk 		(07,05,16,05,"ADW_PIRATECAMP_BEACH_11");
	TA_Stand_Drinking 	(16,05,20,05,"ADW_PIRATECAMP_BEACH_11");
	TA_Smalltalk 		(20,05,21,05,"ADW_PIRATECAMP_BEACH_11");
	TA_Stand_Drinking	(21,05,07,05,"ADW_PIRATECAMP_BEACH_11");
};

FUNC VOID Rtn_Follow_1365 ()
{	
	TA_Follow_Player 	(08,00,20,00,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player	(20,00,08,00,"ADW_CANYON_TELEPORT_PATH_06");
};

