instance BDT_10018_Addon_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_TORWACHE;
	guild 		= GIL_BDT;
	id 			= 10018;
	voice 		= 4;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//---aivars-----
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Jackal, BodyTex_L, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10018;
};
FUNC VOID Rtn_Start_10018()
{
	TA_Guard_Passage (00,00,12,00,"BL_RAVEN_GUARD_01");
	TA_Guard_Passage (12,00,00,00,"BL_RAVEN_GUARD_01");
};
