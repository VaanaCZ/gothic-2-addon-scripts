

instance BAU_953_Bauer (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BAUER;
	guild 		= GIL_OUT;
	id 			= 953;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart04, BodyTex_N, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_953;
};

FUNC VOID Rtn_Start_953 ()
{	
	TA_Pick_FP		(08,05,12,05,"NW_FARM1_FIELD_03");
	TA_Pick_FP		(12,05,15,05,"NW_FARM1_FIELD_06");
	TA_Pick_FP		(15,05,18,05,"NW_FARM1_FIELD_03");
	TA_Pick_FP		(18,05,22,05,"NW_FARM1_FIELD_06");
    TA_Sit_Campfire (22,05,08,05,"NW_FARM1_MILL_05");
};

FUNC VOID Rtn_BugsThere_953 () 
{	
	TA_Sit_Campfire		 (08,05,22,05,"NW_FARM1_MILL_05");
    TA_Sit_Campfire 	 (22,05,08,05,"NW_FARM1_MILL_05");
};

