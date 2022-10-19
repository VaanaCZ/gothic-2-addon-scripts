INSTANCE PIR_1366_Addon_Brandon (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brandon";
	guild 		= GIL_PIR;
	id 			= 1366;
	voice 		= 4;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 400;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1366;
};

FUNC VOID Rtn_Start_1366 ()
{	
	TA_Smalltalk 		(07,03,21,03,"ADW_PIRATECAMP_BEACH_06");
	TA_Stand_Drinking	(21,03,22,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire		(22,03,01,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Stand_Drinking	(01,03,03,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire		(03,03,04,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Pee				(04,03,04,09,"ADW_PIRATECAMP_BEACH_18");
	TA_Stand_Drinking	(04,09,04,14,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire		(04,14,07,03,"ADW_PIRATECAMP_BEACH_18");
};

FUNC VOID Rtn_Follow_1366 ()
{	
	TA_Follow_Player 	(08,00,20,00,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player	(20,00,08,00,"ADW_CANYON_TELEPORT_PATH_06");
};

