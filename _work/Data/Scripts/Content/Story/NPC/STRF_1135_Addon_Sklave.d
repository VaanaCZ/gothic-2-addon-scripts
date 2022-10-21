instance STRF_1135_Addon_Sklave (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Sklave; 
	guild 		= GIL_STRF;
	id 			= 1135;
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
	
	// ------ Inventory ------
	

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_Tough_Torrez, BodyTex_P, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1135;
};

FUNC VOID Rtn_Start_1135 ()
{	
	TA_Stand_WP	 (08,00,23,00,"ADW_MINE_SKLAVENTOD_05");
    TA_Stand_WP	 (23,00,08,00,"ADW_MINE_SKLAVENTOD_05");
};
