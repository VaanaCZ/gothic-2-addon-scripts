

instance BAU_908_Hodges (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hodges";
	guild 		= GIL_BAU;
	id 			= 908;
	voice 		= 3;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMw_1h_Bau_Axe, 1);
	CreateInvItems (self, ItMw_1h_Vlk_Axe, 1);
	CreateInvItems (self, ItMw_1H_Mace_L_04, 1);
	CreateInvItems (self, ItMw_1h_Sld_Axe, 1);
	CreateInvItems (self, ItMw_1h_Sld_Sword, 1);
	CreateInvItems (self, ItMw_Schwert, 1);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_NormalBart01, BodyTex_L, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_908;
};

FUNC VOID Rtn_Start_908 ()
{	
	TA_Smith_Sharp		    (07,00,19,00,"NW_BIGFARM_SMITH_SHARP");
    TA_Sleep				(19,00,07,00,"NW_BIGFARM_STABLE_SLEEP_02");
};

FUNC VOID Rtn_BennetWeg_908 ()
{	
	TA_Stand_Drinking	    (07,00,19,00,"NW_BIGFARM_PATH_HODGES");
    TA_Stand_Drinking		(19,00,07,00,"NW_BIGFARM_PATH_HODGES");
};
