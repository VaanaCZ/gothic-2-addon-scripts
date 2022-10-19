instance BDT_10023_Addon_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sklavenwache";
	guild 		= GIL_BDT;
	id 			= 10023;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self,-1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10023;
};
FUNC VOID Rtn_Start_10023()
{
	TA_Stand_Guarding	(06,00,12,00,"ADW_MINE_LAGER_01");
	TA_Stand_Guarding	(12,00,06,00,"ADW_MINE_LAGER_01");
};
FUNC VOID Rtn_SOUP_10023()
{
	TA_Stand_Eating	(06,00,12,00,"ADW_MINE_27");
	TA_Stand_Eating	(12,00,06,00,"ADW_MINE_27");
};

