

instance DJG_705_Angar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Angar";
	guild 		= GIL_DJG;
	id 			= 705;
	voice 		= 4;
	flags       = 0;					//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Zweihaender2);
	CreateInvItems (self, ItPo_Health_03, 6);									
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit man seine Leiche findet, wenn er im Kampf stirbt!									
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_CorAngar, BodyTex_B, ITAR_CorAngar);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_705;
};

FUNC VOID Rtn_PreStart_705 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"OC_TO_MAGE");
    TA_Stand_ArmsCrossed					(23,00,08,00,"OC_TO_MAGE");		
};

FUNC VOID Rtn_Start_705 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"OW_DJG_WATCH_STONEHENGE_01");
    TA_Stand_ArmsCrossed					(23,00,08,00,"OW_DJG_WATCH_STONEHENGE_01");		
};


FUNC VOID Rtn_Zwischenstop_705 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"OW_PATH_3_13");
    TA_Stand_ArmsCrossed					(23,00,08,00,"OW_PATH_3_13");		
};

FUNC VOID Rtn_GotoStonehendgeEntrance_705 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"OW_PATH_3_STONES");
    TA_Stand_ArmsCrossed					(23,00,08,00,"OW_PATH_3_STONES");		
};

FUNC VOID Rtn_LeavingOW_705 ()
{
	TA_Sit_Campfire					(08,00,23,00,"OW_CAVALORN_01");
    TA_Sit_Campfire					(23,00,08,00,"OW_CAVALORN_01");		
};

FUNC VOID Rtn_Angriff_705 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"OW_UNDEAD_DUNGEON_02");
    TA_Stand_ArmsCrossed					(23,00,08,00,"OW_UNDEAD_DUNGEON_02");		
};

FUNC VOID Rtn_RunToEntrance_705 ()
{
	TA_RunToWP 					(08,00,23,00,"OW_PATH_3_STONES");
    TA_RunToWP					(23,00,08,00,"OW_PATH_3_STONES");		
};

FUNC VOID Rtn_Tot_705 ()
{
	TA_RunToWP 					(08,00,23,00,"TOT");
    TA_RunToWP					(23,00,08,00,"TOT");		
};

