instance BDT_1088_Addon_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_TORWACHE;
	guild 		= GIL_BDT;
	id 			= 1088;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//---aivars-----
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,6);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart_Huno, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 85); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1088;
};
FUNC VOID Rtn_Start_1088 ()
{
    TA_Guard_Passage  (09,00,21,00,"BL_UP_GUARD");
    TA_Guard_Passage  (21,00,09,00,"BL_UP_GUARD");		
};
