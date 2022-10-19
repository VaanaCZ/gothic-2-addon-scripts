instance BDT_1092_Addon_Isabel (Npc_Default)
{
	// ------ NSC ------
	name 		= "Isabel"; 
	guild 		= GIL_BDT;
	id 			= 1092;
	voice 		= 17;
	flags  		= 0;																	
	npctype		= NPCTYPE_BL_MAIN;
	
	
	aivar[AIV_IgnoresArmor] 		= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	//EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_S, NO_ARMOR);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1092;
};

FUNC VOID Rtn_Start_1092 ()
{	
    TA_Smalltalk 	 	(07,01,12,00,"BL_INN_UP_07");
    TA_Stand_Drinking   (12,00,01,05,"BL_INN_UP_05");
	TA_Sleep  		 	(01,05,07,01,"BL_INN_UPSIDE_SLEEP_02");
};
