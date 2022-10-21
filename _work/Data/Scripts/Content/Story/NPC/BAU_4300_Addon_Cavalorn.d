instance Bau_4300_Addon_Cavalorn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cavalorn";
	guild 		= GIL_NONE;
	id 			= 4300;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;	
	npctype		= NPCTYPE_FRIEND;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	EquipItem (self, ItRw_sld_bow);  
	CreateInvItems (self, ITAR_BAU_L, 1);	

	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Cavalorn, BodyTex_B, ITAR_RANGER_ADDON);	 
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4300;
};

FUNC VOID Rtn_Start_4300 ()
{	
	TA_Stand_Eating	(05,00,20,00,"NW_XARDAS_GOBBO_01");
	TA_Stand_Eating	(20,00,05,00,"NW_XARDAS_GOBBO_01");
};

FUNC VOID Rtn_KillBandits_4300 ()
{	
	TA_RunToWP	(05,00,20,00,"NW_XARDAS_BANDITS_LEFT");
	TA_RunToWP	(20,00,05,00,"NW_XARDAS_BANDITS_LEFT");
};

FUNC VOID Rtn_OrnamentSteinring_4300 ()
{	
	TA_Stand_WP	(05,00,20,00,"NW_LITTLESTONEHENDGE");
	TA_Stand_WP	(20,00,05,00,"NW_LITTLESTONEHENDGE");
};

FUNC VOID Rtn_PreRangerMeeting_4300 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_06");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_06");
};

FUNC VOID Rtn_RangerMeeting_4300 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};
FUNC VOID Rtn_Parking_4300 ()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Stadt_4300 ()
{	
	TA_Sit_Bench 	(05,00,20,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Sit_Bench	(20,00,05,00,"NW_CITY_MERCHANT_PATH_15");
};
