instance STRF_1124_Addon_Monty_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Monty"; 
	guild 		= GIL_VLK;
	id 			= 1124;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor]  = TRUE;
	aivar[AIV_ToughGuy] 	 = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2H_Axe_L_01 );
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart04, BodyTex_N, ITAR_Bau_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1124;
};

FUNC VOID Rtn_Start_1124 ()
{	
	TA_Read_Bookstand (00,00,12,00,"NW_CITY_HABOUR_WERFT_IN_01");
	TA_Read_Bookstand (12,00,00,00,"NW_CITY_HABOUR_WERFT_IN_01");
};
