instance BDT_1026_Bandit_H (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT; 
	guild 		= GIL_BDT;
	id 			= 1026;
	voice 		= 13;
	flags       = 0;									
	npctype		= NPCTYPE_AMBIENT;
	
	//--------Aivars-----------------------
	aivar[AIV_EnemyOverride] = TRUE;  

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------							
	EquipItem			(self, ItMw_1h_Bau_Mace);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------									
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_N_Normal14, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------						
	B_SetFightSkills (self, 50); 

	// ------ TA ------
	start_aistate = ZS_Bandit;
};
