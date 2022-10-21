
instance SLD_841_Engardo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Engardo"; 
	guild 		= GIL_BDT;
	id 			= 841;
	voice 		= 13;
	flags       = 0;						
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	//--------Aivars-----------------------
	aivar[AIV_EnemyOverride] = TRUE;  
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2h_Sld_Sword);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Erpresser, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_841;
};

FUNC VOID Rtn_PreStart_841 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FARM2_PATH_02");
    TA_Stand_Guarding		(22,00,08,00,"NW_FARM2_PATH_02");
};

FUNC VOID Rtn_Start_841 ()
{
	TA_Smalltalk		(08,00,22,00,"NW_FARM2_TO_TAVERN_08");
    TA_Smalltalk		(22,00,08,00,"NW_FARM2_TO_TAVERN_08");	
};

FUNC VOID Rtn_Bigfarm_841 ()
{
	TA_Smalltalk		(08,00,22,00,"NW_BIGFARM_HOUSE_OUT_05");
    TA_Sit_Chair 		(22,00,08,00,"NW_BIGFARM_HOUSE_12");	
};
