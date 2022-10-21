instance STRF_1121_Addon_Telbor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Telbor"; 
	guild 		= GIL_STRF;
	id 			= 1121;
	voice 		= 12;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
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
	daily_routine 		= Rtn_Start_1121;
};

FUNC VOID Rtn_Start_1121 ()
{	
	TA_Pick_Ore		 (08,00,23,00,"ADW_MINE_LAGER_SIDE_PICK_02");
    TA_Pick_Ore      (23,00,08,00,"ADW_MINE_LAGER_SIDE_PICK_02");
};
FUNC VOID Rtn_Flucht_1121 ()
{	
	TA_RunToWP 	(08,00,23,00,"ADW_BL_HOEHLE_03");
    TA_RunToWP		(23,00,08,00,"ADW_BL_HOEHLE_03");
};
