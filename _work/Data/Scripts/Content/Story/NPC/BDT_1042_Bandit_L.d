instance BDT_1042_Bandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT; 
	guild 		= GIL_BDT;
	id 			= 1042;
	voice 		= 10;
	flags       = 0;								
	npctype		= NPCTYPE_AMBIENT;
	
	//--------Aivars-----------
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Mace);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_L_Tough02, BodyTex_L, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	daily_routine = Rtn_Start_1042;
};	 
	// ------ TA ------
	FUNC VOID RTn_Start_1042()
	{
		TA_Saw (00,00,12,00,"NW_CASTLEMINE_PATH_HUT_02");
		TA_Saw (12,00,00,00,"NW_CASTLEMINE_PATH_HUT_02");
	};
	
