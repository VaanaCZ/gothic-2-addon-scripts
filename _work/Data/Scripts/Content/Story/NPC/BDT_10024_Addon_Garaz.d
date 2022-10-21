instance BDT_10024_Addon_Garaz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garaz";
	guild 		= GIL_BDT;
	id 			= 10024;
	voice 		= 8;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal16, BodyTex_N, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10024;
};
FUNC VOID Rtn_Start_10024()
{
	TA_Stand_Guarding	(06,00,12,00,"ADW_MINE_TO_MC_04");
	TA_Stand_Guarding	(12,00,06,00,"ADW_MINE_TO_MC_04");
};
FUNC VOID Rtn_Attack_10024()
{
	TA_Guide_Player 	(06,00,12,00,"ADW_MINE_MC_07");
	TA_Guide_Player		(12,00,06,00,"ADW_MINE_MC_07");
};
FUNC VOID Rtn_Gold_10024()
{
	TA_Stand_Guarding	(06,00,12,00,"ADW_MINE_MC_GARAZ");
	TA_Stand_Guarding	(12,00,06,00,"ADW_MINE_MC_GARAZ");
};
