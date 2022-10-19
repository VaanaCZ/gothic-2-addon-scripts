

instance BAU_935_Bronko (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bronko";
	guild 		= GIL_NONE;
	id 			= 935;
	voice 		= 6;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_2h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems		(self,	ItMi_Gold,	35);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Kirgo, BodyTex_B, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_935;
};

FUNC VOID Rtn_PreStart_935 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FARM4_BRONKO");
    TA_Sit_Campfire			(22,00,08,00,"NW_FARM4_REST_02");
};

FUNC VOID Rtn_Start_935 ()
{	
	TA_Pick_FP				(08,00,22,00,"NW_FARM4_FIELD_01");
    TA_Pick_FP				(22,00,08,00,"NW_FARM4_FIELD_01");
};

