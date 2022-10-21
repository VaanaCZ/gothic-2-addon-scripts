

instance BAU_930_Sekob (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sekob";
	guild 		= GIL_OUT;
	id 			= 930;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL; 															//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_P_OldMan_Gravo, BodyTex_P, ITAR_Vlk_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_930;
};

FUNC VOID Rtn_Start_930 ()
{	
	TA_Sit_Throne 	(08,00,22,00,"NW_FARM4_SEKOB"); 
    TA_Sleep		(22,00,08,00,"NW_FARM4_IN_BED");
};

FUNC VOID Rtn_FleeDMT_930 ()
{	
	TA_Stand_WP	(08,00,22,00,"NW_BIGFARM_FARM4_PATH_01");
    TA_Stand_WP	(22,00,08,00,"NW_BIGFARM_FARM4_PATH_01");
};

FUNC VOID Rtn_Obsessed_930 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"NW_FARM4_02");
    TA_Stand_Guarding	(22,00,08,00,"NW_FARM4_02");
};
