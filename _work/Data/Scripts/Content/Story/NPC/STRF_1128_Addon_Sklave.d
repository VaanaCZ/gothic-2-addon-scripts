instance STRF_1128_Addon_Sklave (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Sklave; 
	guild 		= GIL_STRF;
	id 			= 1128;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_B_Normal_Orik, BodyTex_B, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1128;
};

FUNC VOID Rtn_Start_1128 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"ADW_MINE_19");
    TA_Pick_Ore	 (23,00,08,00,"ADW_MINE_19");
};
FUNC VOID Rtn_Flucht_1128 ()
{	
	TA_RunToWP	 (08,00,23,00,"ADW_BL_HOEHLE_02");
    TA_RunToWP	 (23,00,08,00,"ADW_BL_HOEHLE_02");
};
