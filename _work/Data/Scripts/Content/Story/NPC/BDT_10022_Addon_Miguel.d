instance BDT_10022_Addon_Miguel (Npc_Default)
{
	// ------ NSC ------
	name 		= "Miguel";
	guild 		= GIL_BDT;
	id 			= 10022;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Nagelknueppel);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, Itpo_health_01, 20);
	CreateInvItems (self, Itpo_health_02, 8);
	CreateInvItems (self, Itpo_health_03, 5);
	CreateInvItems (self, Itpo_mana_01, 7);
		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_OldMan_Gravo, BodyTex_P, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10022;
};
FUNC VOID Rtn_Start_10022()
{
	TA_Pick_FP	(06,00,12,00,"ADW_PATH_TO_VP3_01");
	TA_Pick_FP	(12,00,18,00,"ADW_PATH_TO_VP3_02");
	TA_Pick_FP	(18,00,22,00,"ADW_PATH_TO_VP3_03");
	
	TA_Sit_Bench   (22,00,06,00,"ADW_SWAMP_SIT_BENCH_03");
};
