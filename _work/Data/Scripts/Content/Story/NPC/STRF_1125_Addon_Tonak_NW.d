instance STRF_1125_Addon_Tonak_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tonak"; 
	guild 		= GIL_OUT;
	id 			= 1125;
	voice 		= 3;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_B_Normal01, BodyTex_B, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, - 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1125;
};

FUNC VOID Rtn_Start_1125 ()
{	
	TA_Rake_FP (00,00,12,00,"NW_FARM2_FIELD_TANOK");
	TA_Rake_FP (12,00,00,00,"NW_FARM2_FIELD_TANOK");
};
