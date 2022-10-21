instance STRF_1118_Addon_Patrick (Npc_Default)
{
	// ------ NSC ------
	name 		= "Patrick"; 
	guild 		= GIL_STRF;
	id 			= 1118;
	voice 		= 7;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NoFightParker] 		= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_NewsOverride]			= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2H_Axe_L_01 );
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_NormalBart02, BodyTex_L, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1118;
};

FUNC VOID Rtn_Start_1118 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"ADW_MINE_LAGER_05");
    TA_Pick_Ore	 (23,00,08,00,"ADW_MINE_LAGER_05");
};
FUNC VOID Rtn_Flucht_1118 ()
{	
	TA_RunToWP	 (08,00,23,00,"ADW_BL_HOEHLE_04");
    TA_RunToWP	 (23,00,08,00,"ADW_BL_HOEHLE_04");
};
