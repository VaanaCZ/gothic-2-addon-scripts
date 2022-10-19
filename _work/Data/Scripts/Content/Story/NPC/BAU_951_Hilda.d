

instance BAU_951_Hilda (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hilda";
	guild 		= GIL_OUT;
	id 			= 951;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_WhiteCloth, BodyTexBabe_N, ITAR_BauBabe_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 10); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_951;
};

FUNC VOID Rtn_Start_951 ()
{	
	TA_Cook_Stove	(08,00,22,00,"NW_FARM1_INHOUSE_02");
    TA_Sleep 		(22,00,08,00,"NW_FARM1_INHOUSE_BED_02");
};


FUNC VOID Rtn_Krank_951 ()
{	
	TA_Sleep		(08,00,22,00,"NW_FARM1_INHOUSE_BED_02");
    TA_Sleep 		(22,00,08,00,"NW_FARM1_INHOUSE_BED_02");
};



