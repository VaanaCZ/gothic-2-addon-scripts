instance BDT_1081_Addon_Wache_01 (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Esteban_Guard;
	guild 		= GIL_BDT;
	id 			= 1081;
	voice 		= 4;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//------- AIVAR -------
	
	AIVAR[AIV_StoryBandit_Esteban] 	= TRUE;
	AIVAR[AIV_StoryBandit] 			= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Pal_Sword);
	EquipItem (self, ItRw_Mil_Crossbow);

	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal14, BodyTex_N, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1081;
};
FUNC VOID Rtn_Start_1081 ()
{
 	TA_Stand_Guarding (00,00,00,00,"BL_MID_07_B");
	TA_Stand_Guarding (00,00,00,00,"BL_MID_07_B");
};
FUNC VOID Rtn_Ambush_1081 ()
{
 	TA_Stand_Guarding (00,00,00,00,"BL_INN_OUTSIDE_01");
	TA_Stand_Guarding (00,00,00,00,"BL_INN_OUTSIDE_01");
};
