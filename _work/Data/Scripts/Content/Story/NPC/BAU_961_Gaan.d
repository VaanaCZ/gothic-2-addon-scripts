

instance BAU_961_Gaan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gaan";
	guild 		= GIL_NONE;
	id 			= 961;
	voice 		= 3;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	EquipItem			(self, ItRw_Sld_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 25); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_961;
};

FUNC VOID Rtn_PreStart_961 ()
{	
	TA_Stand_ArmsCrossed 		 (08,00,22,00,"NW_FARM3_PATH_LEVELCHANGE_02");	 
    TA_Stand_ArmsCrossed		 (22,00,08,00,"NW_FARM3_PATH_LEVELCHANGE_02");
};

FUNC VOID Rtn_Start_961 ()
{	
	TA_Stand_ArmsCrossed 		 (08,00,22,00,"NW_FARM3_GAAN");
    TA_Stand_ArmsCrossed		 (22,00,08,00,"NW_FARM3_STABLE_REST_01"); 
};

FUNC VOID Rtn_PreRangerMeeting_961 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_03");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_03");
};

FUNC VOID Rtn_RangerMeeting_961 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Parking_961 ()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};


