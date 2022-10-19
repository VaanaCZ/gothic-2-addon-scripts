

instance BAU_955_Bauer (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BAUER;
	guild 		= GIL_OUT;
	id 			= 955;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		 
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal06, BodyTex_N, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_955;
};

FUNC VOID Rtn_Start_955 ()
{	
	TA_Pick_FP			(08,10,12,10,"NW_FARM1_FIELD_07");
	TA_Pick_FP			(12,10,15,10,"NW_FARM1_FIELD_02");
	TA_Pick_FP			(15,10,18,10,"NW_FARM1_FIELD_07");
	TA_Pick_FP			(18,10,22,10,"NW_FARM1_FIELD_02");
    TA_Sit_Campfire 	(22,10,08,10,"NW_FARM1_MILL_05");
};

FUNC VOID Rtn_BugsThere_955 ()
{	
	TA_Sit_Campfire		 (08,10,22,10,"NW_FARM1_MILL_05");
    TA_Sit_Campfire 	 (22,10,08,10,"NW_FARM1_MILL_05");
};






