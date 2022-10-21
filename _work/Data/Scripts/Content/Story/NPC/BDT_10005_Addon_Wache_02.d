instance BDT_10005_Addon_Wache_02 (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Esteban_Guard;
	guild 		= GIL_BDT;
	id 			= 10005;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//------- AIVAR -------
	
	AIVAR[AIV_StoryBandit_Esteban] 	= TRUE;
	AIVAR[AIV_StoryBandit] 			= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	EquipItem (self, ItRw_Mil_Crossbow);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Orik, BodyTex_B, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10005;
};
FUNC VOID Rtn_Start_10005 ()
{
    TA_Stand_Guarding   (09,00,21,00,"BL_MID_07_SHARP");
    TA_Stand_Guarding   (21,00,09,00,"BL_MID_07_SHARP");		
};
FUNC VOID Rtn_Ambush_10005 ()
{
    TA_Stand_Guarding   (09,00,21,00,"BL_INN_OUTSIDE_02");
    TA_Stand_Guarding   (21,00,09,00,"BL_INN_OUTSIDE_02");		
};
