INSTANCE PIR_1352_Addon_AlligatorJack (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alligator Jack";
	guild 		= GIL_PIR;
	id 			= 1352;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 800;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
		
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_02, 4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_CorAngar, BodyTex_B, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);		
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1352;
};

FUNC VOID Rtn_PreStart_1352 ()
{	
	TA_Stand_Eating	(05,00,20,00,"ADW_ENTRANCE_2_PIRATECAMP_01");
	TA_Stand_Eating	(20,00,05,00,"ADW_ENTRANCE_2_PIRATECAMP_01");
};

FUNC VOID Rtn_Start_1352 ()
{	
	TA_Sleep			 (23,00,06,00,"ADW_PIRATECAMP_AJ_04");
	TA_Cook_Pan			 (06,00,08,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire		 (08,30,12,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (12,30,19,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Cook_Pan			 (19,00,20,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire		 (20,30,23,00,"AD_PIRATECAMP_AJ_03");
};

FUNC VOID Rtn_Hunt1_1352 ()
{
	TA_Guide_Player (01,00,13,00,"ADW_PIRATECAMP_WAY_16");	
	TA_Guide_Player (13,00,01,00,"ADW_PIRATECAMP_WAY_16");
};

FUNC VOID Rtn_Hunt2_1352 ()
{
	TA_Guide_Player (01,00,13,00,"ADW_PIRATECAMP_WATERHOLE_07");	
	TA_Guide_Player (13,00,01,00,"ADW_PIRATECAMP_WATERHOLE_07");
}; 

FUNC VOID Rtn_Hunt3_1352 ()
{
	TA_Guide_Player (01,00,13,00,"ADW_PIRATECAMP_WAY_16"); 
	TA_Guide_Player (13,00,01,00,"ADW_PIRATECAMP_WAY_16"); 
};

FUNC VOID Rtn_Hunt4_1352 ()
{
	TA_Guide_Player (01,00,13,00,"ADW_CANYON_TELEPORT_PATH_06"); 
	TA_Guide_Player (13,00,01,00,"ADW_CANYON_TELEPORT_PATH_06"); 
};

FUNC VOID Rtn_PIRATECAMP_1352 ()
{
	TA_Guide_Player (01,00,13,00,"ADW_PIRATECAMP_WAY_07"); 
	TA_Guide_Player (13,00,01,00,"ADW_PIRATECAMP_WAY_07"); 
};

FUNC VOID Rtn_GregIsBack_1352 ()
{
	TA_Sleep			 (03,00,06,00,"ADW_PIRATECAMP_AJ_04");
	TA_Cook_Pan			 (06,00,07,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (07,00,10,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Sit_Campfire		 (10,00,11,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (11,30,16,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Cook_Pan			 (16,00,17,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (17,00,20,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Sit_Campfire		 (20,00,21,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (21,00,00,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Sit_Campfire		 (00,00,01,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (01,00,03,00,"ADW_PIRATECAMP_WAY_07");	
};

FUNC VOID Rtn_Follow_1352 ()
{	
	TA_Follow_Player (05,00,20,00, "ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player (20,00,05,00, "ADW_CANYON_TELEPORT_PATH_06");
};
