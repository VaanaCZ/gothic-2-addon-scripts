instance STRF_1129_Addon_Sklave (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Sklave; 
	guild 		= GIL_STRF;
	id 			= 1129;
	voice 		= 3;
	flags       = 0;							
	npctype		= NPCTYPE_BL_AMBIENT;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);										
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak_Asghan, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1129;
};

FUNC VOID Rtn_Start_1129 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"ADW_MINE_TO_MC_04_B");
    TA_Pick_Ore	 (23,00,08,00,"ADW_MINE_TO_MC_04_B");
};
FUNC VOID Rtn_Flucht_1129 ()
{	
	TA_RunToWP	 (08,00,23,00,"ADW_BL_HOEHLE_02");
    TA_RunToWP	 (23,00,08,00,"ADW_BL_HOEHLE_02");
};
