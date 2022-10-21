instance BDT_1076_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 1076;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_TAL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Mace_L_04);
	EquipItem (self, ItRw_Bow_M_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart06, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1076;
};
FUNC VOID Rtn_Start_1076 ()
{
 	TA_Smalltalk 	 (06,00,12,00,"BL_SMALLTALK_01");
	TA_Cook_Cauldron (12,00,22,00,"ADW_PATH_TO_BL_COOK");
	TA_Stand_Eating  (22,00,06,00,"BL_FIGHT_04");
};
