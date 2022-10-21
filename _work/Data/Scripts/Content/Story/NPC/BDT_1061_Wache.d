instance BDT_1061_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Wache; 
	guild 		= GIL_BDT;
	id 			= 1061;
	voice 		= 1;
	flags       = 0;								
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_ShortSword2);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart17, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	daily_routine = Rtn_Start_1061;
};	 
	// ------ TA ------
	FUNC VOID RTn_Start_1061()
	{
		TA_Stand_Guarding 	(00,00,12,00,"NW_CASTLEMINE_PATH_02");
		TA_Stand_Guarding 	(12,00,00,00,"NW_CASTLEMINE_PATH_02");
	};
