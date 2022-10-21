
instance Mil_350_Addon_Martin (Npc_Default)
{
	// ------ NSC ------
	name 		= "Martin";	
	guild 		= GIL_NONE;//wegen Rangermeeting
	id 			= 350;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_OldMan_Gravo, BodyTex_P, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_350; 
};

FUNC VOID Rtn_PreStart_350()
{	
	TA_Study_WP	(04,00,23,00,"NW_CITY_PALCAMP_15");
    TA_Study_WP (23,00,04,00,"NW_CITY_PALCAMP_15");	
};

FUNC VOID Rtn_Start_350 ()
{	
	TA_Study_WP	(04,00,23,00,"NW_CITY_PALCAMP_15");
    TA_Sit_Chair (23,00,04,00,"NW_CITY_HABOUR_TAVERN01_04");	
};

FUNC VOID Rtn_PreRangerMeeting_350 ()
{	
	TA_RangerMeeting 	(05,00,20,00,"NW_TAVERNE_07");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_07");
};

FUNC VOID Rtn_RangerMeeting_350 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};
FUNC VOID Rtn_Parking_350 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_Guarding	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

