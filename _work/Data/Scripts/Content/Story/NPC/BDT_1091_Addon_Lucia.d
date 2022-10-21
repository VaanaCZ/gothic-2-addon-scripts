instance BDT_1091_Addon_Lucia (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lucia"; 
	guild 		= GIL_BDT;
	id 			= 1091;
	voice 		= 16;
	flags  		= 0;																	
	npctype		= NPCTYPE_BL_MAIN;
	
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																					
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_GreyCloth, BodyTexBabe_F, NO_ARMOR);
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1091;
};

FUNC VOID Rtn_Start_1091 ()
{	
    TA_Stand_WP  		  (07,00,12,00,"BL_INN_05_D");
    TA_Stand_Sweeping 	  (12,00,14,00,"BL_INN_05_B");   
    TA_Stand_WP 		  (14,00,01,00,"BL_INN_05_D");
    TA_Potion_Alchemy 	  (01,00,04,00,"BL_INN_UP_LABOR");	
    TA_Sleep		      (04,00,07,00,"BL_INN_UPSIDE_SLEEP_01");
};



