instance BDT_10016_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 10016;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_TAL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Fingers, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10016;
};
FUNC VOID Rtn_Start_10016()
{
	TA_Sit_Chair 	(02,00,10,00,"ADW_SENAT_CAVE_CHAIR");
	TA_Sit_Chair 	(10,00,02,00,"ADW_SENAT_CAVE_CHAIR");
};
FUNC VOID Rtn_Stand_10016()
{
	TA_Stand_WP 	(02,00,10,00,"ADW_SENAT_CAVE_CHAIR");
	TA_Stand_WP 	(10,00,02,00,"ADW_SENAT_CAVE_CHAIR");
};
