
instance STRF_1107_Straefling (Npc_Default)
{
	// ------ NSC ------
	name 		= "Koch";
	guild 		= GIL_STRF;
	id 			= 1107;
	voice 		= 1;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItMw_2H_Axe_L_01 );
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart04, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1107;
};

FUNC VOID Rtn_Start_1107 ()
{	
	TA_Cook_Cauldron		(08,00,23,00,"OC_EBR_KITCHEN_COOK");
    TA_Cook_Cauldron		(23,00,08,00,"OC_EBR_KITCHEN_COOK");
};

