instance STRF_1143_Addon_Sklave (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Sklave; 
	guild 		= GIL_STRF;
	id 			= 1143;
	voice 		= 3;
	flags       = 0;							
	npctype		= NPCTYPE_BL_AMBIENT;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,1);												
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal08, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1143;
};

FUNC VOID Rtn_Start_1143 ()
{	
	TA_Stand_WP 	 (08,00,23,00,"BL_UP_PLACE_06_SIDE_01");
    TA_Stand_WP 	 (23,00,08,00,"BL_UP_PLACE_06_SIDE_01");
};
