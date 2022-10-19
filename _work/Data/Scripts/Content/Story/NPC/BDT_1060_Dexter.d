instance BDT_1060_Dexter (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dexter"; 
	guild 		= GIL_BDT;
	id 			= 1060;
	voice 		= 9;
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
	CreateInvItems (self, ItKE_Dexter,1);
	CreateInvItems 	(self, ItWr_RavensKidnapperMission_Addon, 1 );
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_DIEGO);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	daily_routine = Rtn_Start_1060;
};	 
	// ------ TA ------
	FUNC VOID RTn_Start_1060()
	{
		TA_Sit_Throne (00,00,12,00,"NW_CASTLEMINE_HUT_10");
		TA_Sit_Throne (12,00,00,00,"NW_CASTLEMINE_HUT_10");
	};
