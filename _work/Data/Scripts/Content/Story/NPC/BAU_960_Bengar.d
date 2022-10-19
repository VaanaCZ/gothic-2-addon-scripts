

instance BAU_960_Bengar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bengar";
	guild 		= GIL_OUT;
	id 			= 960;
	voice 		= 10;
	flags       = NPC_FLAG_IMMORTAL;													//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Axe);
	EquipItem			(self, ItRw_Sld_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal_Olli_Kahn, BodyTex_N, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 25); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_960;
};

FUNC VOID Rtn_Start_960 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FARM3_BENGAR");
    TA_Stand_Guarding		(22,00,08,00,"NW_FARM3_BENGAR"); 
};

FUNC VOID Rtn_MilComing_960 ()
{	
	TA_Smalltalk		(08,00,22,00,"NW_FARM3_BENGAR"); 
    TA_Smalltalk		(22,00,08,00,"NW_FARM3_BENGAR");
};



