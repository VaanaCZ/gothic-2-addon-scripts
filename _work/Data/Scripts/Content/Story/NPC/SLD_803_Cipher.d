
instance SLD_803_Cipher (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cipher";
	guild 		= GIL_SLD;
	id 			= 803;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);														//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	CreateInvItems (self, ItRw_Arrow, 50);
	CreateInvItems (self, ItRw_Bow_L_02, 1);
	CreateInvItems (self, ItRw_Sld_Bow, 1);
	CreateInvItems (self, ItMw_2H_OrcAxe_01, 1);
	
	CreateInvItems (self, ItLsTorch, 8);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_803;
};

FUNC VOID Rtn_Start_803 ()
{
	TA_Smalltalk	(07,35,23,35,"NW_BIGFARM_PATH_04_1");
	TA_Sleep		(23,35,07,35,"NW_BIGFARM_HOUSE_SLD_SLEEP");		
};

FUNC VOID Rtn_Tot_803 ()
{
	TA_Sleep		(08,00,23,00,"TOT");
    TA_Sleep		(23,00,08,00,"TOT");		
};

