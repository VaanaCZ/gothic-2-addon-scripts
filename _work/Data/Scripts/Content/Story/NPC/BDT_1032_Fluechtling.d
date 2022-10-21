
instance BDT_1032_Fluechtling (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Fluechtling; 
	guild 		= GIL_BDT;
	id 			= 1032;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG ;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_SLD_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart09, BodyTex_N,ITAR_Leather_L );	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1032;
};

FUNC VOID Rtn_Start_1032 ()
{	
   TA_Sleep			(08,00,23,00,"NW_XARDAS_BANDITS_LEFT");
   TA_Sleep			(23,00,08,00,"NW_XARDAS_BANDITS_LEFT");
};
