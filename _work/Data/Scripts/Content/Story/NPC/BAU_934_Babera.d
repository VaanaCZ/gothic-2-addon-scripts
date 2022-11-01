

instance BAU_934_Babera (Npc_Default)
{
	// ------ NSC ------
	name 		= "Babera";
	guild 		= GIL_OUT;
	id 			= 934;
	voice 		= 16;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BauBlonde, BodyTexBabe_N, ITAR_BauBabe_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_934;
};

FUNC VOID Rtn_Start_934 ()
{	
	TA_Pick_FP			(08,00,22,00,"NW_FARM4_FIELD_01");
    TA_Sit_Campfire		(22,00,08,00,"NW_FARM4_REST_02");
};

FUNC VOID Rtn_FleeDMT_934 ()
{	
	TA_Pick_FP			(08,00,22,00,"NW_FARM4_FIELD_01");
    TA_Pick_FP			(22,00,08,00,"NW_FARM4_FIELD_01");
};




