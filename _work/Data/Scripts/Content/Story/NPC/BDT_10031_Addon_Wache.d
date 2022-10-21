instance BDT_10031_Addon_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Wache;
	guild 		= GIL_BDT;
	id 			= 10031;
	voice 		= 6;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart09, BodyTex_N, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10031;
};
FUNC VOID Rtn_Start_10031()
{
	TA_Stand_Eating	(06,00,12,00,"BL_MINELAGER_03");
	TA_Stand_Eating	(12,00,06,00,"BL_MINELAGER_03");
};
