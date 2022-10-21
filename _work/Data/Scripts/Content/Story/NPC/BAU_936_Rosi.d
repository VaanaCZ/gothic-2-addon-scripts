

instance BAU_936_Rosi  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rosi";
	guild 		= GIL_BAU;
	id 			= 936;
	voice 		= 17;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Hure, BodyTexBabe_N, ITAR_BauBabe_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_936;
};

FUNC VOID Rtn_Start_936 ()
{	
	TA_Cook_Stove  	(08,00,22,00,"NW_FARM4_ROSI");
	TA_Cook_Stove  	(22,00,08,00,"NW_FARM4_ROSI");
    //TA_Sleep 		(22,00,08,00,"NW_FARM4_IN_BED");
};

FUNC VOID Rtn_FleeDMT_936 ()
{	
	TA_Stand_ArmsCrossed 	(08,00,22,00,"NW_FLEEDMT_KAP3");
    TA_Stand_ArmsCrossed	(22,00,08,00,"NW_FLEEDMT_KAP3");
};

FUNC VOID Rtn_FleeFromSekob_936 ()
{	
	TA_Stand_ArmsCrossed 	(08,00,22,00,"NW_TAVERNE_TROLLAREA_14");
    TA_Stand_ArmsCrossed	(22,00,08,00,"NW_TAVERNE_TROLLAREA_14");
};

FUNC VOID Rtn_FollowCity_936 ()
{	
	TA_Follow_Player  	(08,00,22,00,"CITY2");
    TA_Follow_Player	(22,00,08,00,"CITY2");
};

FUNC VOID Rtn_FollowBigfarm_936 ()
{	
	TA_Follow_Player 	(08,00,22,00,"NW_BIGFARM_KITCHEN_02"); 
    TA_Follow_Player	(22,00,08,00,"NW_BIGFARM_KITCHEN_02");
};

FUNC VOID Rtn_FollowKloster_936 ()
{	
	TA_Follow_Player 	(08,00,22,00,"KLOSTER");
    TA_Follow_Player	(22,00,08,00,"KLOSTER");
};

FUNC VOID Rtn_City_936 ()
{	
	TA_Sit_Bench  	(08,00,22,00,"NW_CITY_MERCHANT_PATH_25");  
    TA_Sit_Bench	(22,00,08,00,"NW_CITY_MERCHANT_PATH_25");
};

FUNC VOID Rtn_Bigfarm_936 ()
{	
	TA_Sit_Chair  	(08,00,22,00,"NW_BIGFARM_KITCHEN_02"); 
    TA_Sit_Chair	(22,00,08,00,"NW_BIGFARM_KITCHEN_02");
};

FUNC VOID Rtn_Kloster_936 ()
{	
	TA_Stand_ArmsCrossed 	(08,00,22,00,"NW_MONASTERY_SHEEP_01");	
    TA_Stand_ArmsCrossed		(22,00,08,00,"NW_MONASTERY_SHEEP_01");
};




