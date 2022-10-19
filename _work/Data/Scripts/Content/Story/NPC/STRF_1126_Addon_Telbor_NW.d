instance STRF_1126_Addon_Telbor_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Telbor"; 
	guild 		= GIL_BAU;
	id 			= 1126;
	voice 		= 12;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2H_Axe_L_01 );
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_B_Normal01, BodyTex_B, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1126;
};

FUNC VOID Rtn_Start_1126 ()
{	
	TA_Rake_FP (00,00,12,00,"NW_FARM2_FIELD_TELBOR");
	TA_Rake_FP (12,00,00,00,"NW_FARM2_FIELD_TELBOR");
};
