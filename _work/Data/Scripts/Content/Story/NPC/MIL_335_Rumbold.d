
instance Mil_335_Rumbold (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rumbold";	
	guild 		= GIL_NONE;	
	id 			= 335;
	voice 		= 10;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARs ------
	aivar[AIV_DropDeadAndKill] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Important_Arto, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_335;
};

FUNC VOID Rtn_Start_335()
{	
	TA_Smalltalk 	(08,00,22,00,"NW_FARM3_PATH_02");
    TA_Smalltalk	(22,00,08,00,"NW_FARM3_PATH_02");
};

FUNC VOID Rtn_MilComing_335()
{	
	TA_Smalltalk 	(08,00,22,00,"NW_FARM3_BENGAR");
    TA_Smalltalk	(22,00,08,00,"NW_FARM3_BENGAR");
};

FUNC VOID Rtn_Flucht2_335()
{	
	TA_Smalltalk 	(08,00,22,00,"NW_RUMBOLD_FLUCHT2");
    TA_Smalltalk	(22,00,08,00,"NW_RUMBOLD_FLUCHT2");
};
FUNC VOID Rtn_Flucht3_335()
{	
	TA_Smalltalk 	(08,00,22,00,"NW_RUMBOLD_FLUCHT3");
    TA_Smalltalk	(22,00,08,00,"NW_RUMBOLD_FLUCHT3");
};
