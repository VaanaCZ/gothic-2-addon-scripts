instance BDT_10030_Addon_Buddler (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Buddler;
	guild 		= GIL_BDT;
	id 			= 10030;
	voice 		= 8;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Cronos, BodyTex_P, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10030;
};
FUNC VOID Rtn_Start_10030()
{
	TA_Stand_Drinking	(06,00,12,00,"ADW_MINE_22");
	TA_Stand_Drinking	(12,00,06,00,"ADW_MINE_22");
};
