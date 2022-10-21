instance BDT_1064_Bandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache"; 
	guild 		= GIL_BDT;
	id 			= 1064;
	voice 		= 4;
	flags       = 0;								
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	aivar[AIV_EnemyOverride] = TRUE; 
	aivar[AIV_NewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Mace);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Orik, BodyTex_B, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA ------
	daily_routine = Rtn_Start_1064;
};	 
	
func VOID RTn_Start_1064()
{
	TA_Guard_Passage (00,00,12,00,"NW_CASTLEMINE_TOWER_BEYOND");
	TA_Guard_Passage (12,00,00,00,"NW_CASTLEMINE_TOWER_BEYOND");
};
