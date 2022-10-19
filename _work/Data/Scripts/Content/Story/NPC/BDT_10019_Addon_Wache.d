instance BDT_10019_Addon_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Guard;
	guild 		= GIL_BDT;
	id 			= 10019;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Krummschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Normal_Spassvogel, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10019;
};
FUNC VOID Rtn_Start_10019()
{
	TA_Stand_WP (00,00,12,00,"BL_UP_PLACE_04 ");
	TA_Stand_WP (12,00,00,00,"BL_UP_PLACE_04");
};
