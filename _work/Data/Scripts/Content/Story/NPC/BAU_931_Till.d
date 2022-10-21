

instance BAU_931_Till (Npc_Default)
{
	// ------ NSC ------
	name 		= "Till";
	guild 		= GIL_OUT;
	id 			= 931;
	voice 		= 3;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 25); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_931;
};

FUNC VOID Rtn_PreStart_931 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FARM4_TILL");
    TA_Stand_Guarding		(22,00,08,00,"NW_FARM4_TILL");
};
FUNC VOID Rtn_Start_931 ()
{	
	TA_Saw 			(08,00,22,00,"NW_FARM4_TILL");
    TA_Sit_Throne  	(22,00,08,00,"NW_FARM4_SEKOB");
};

FUNC VOID Rtn_FleeDMT_931 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FLEEDMT_KAP3");
    TA_Stand_Guarding		(22,00,08,00,"NW_FLEEDMT_KAP3");
};

FUNC VOID Rtn_FleeFromSekob_931 ()
{	
	TA_Stand_ArmsCrossed 	(08,00,22,00,"NW_TAVERNE_TROLLAREA_14");
    TA_Stand_ArmsCrossed	(22,00,08,00,"NW_TAVERNE_TROLLAREA_14");
};

FUNC VOID Rtn_FollowCity_931 ()
{	
	TA_Follow_Player  	(08,00,22,00,"CITY2");
    TA_Follow_Player	(22,00,08,00,"CITY2");
};

FUNC VOID Rtn_FollowBigfarm_931 ()
{	
	TA_Follow_Player 	(08,00,22,00,"NW_BIGFARM_KITCHEN_02"); 
    TA_Follow_Player	(22,00,08,00,"NW_BIGFARM_KITCHEN_02");
};

FUNC VOID Rtn_FollowKloster_931 ()
{	
	TA_Follow_Player 	(08,00,22,00,"KLOSTER");
    TA_Follow_Player	(22,00,08,00,"KLOSTER");
};

FUNC VOID Rtn_City_931 ()
{	
	TA_Stand_WP   	(08,00,22,00,"NW_CITY_MERCHANT_PATH_25");  
    TA_Stand_WP 	(22,00,08,00,"NW_CITY_MERCHANT_PATH_25");
};

FUNC VOID Rtn_Bigfarm_931 ()
{	
	TA_Sit_Chair  	(08,00,22,00,"NW_BIGFARM_KITCHEN_02"); 
    TA_Sit_Chair	(22,00,08,00,"NW_BIGFARM_KITCHEN_02");
};

FUNC VOID Rtn_Kloster_931 ()
{	
	TA_Pick_FP  	(08,00,22,00,"NW_MONASTERY_HERB_02");	
    TA_Pick_FP		(22,00,08,00,"NW_MONASTERY_HERB_02");
};




