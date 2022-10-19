
instance PIR_1300_Addon_Greg_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Greg";
	guild 		= GIL_NONE;//Joly:kein GIL_PIR, sonst "Chaos in the City"
	id 			= 1300;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;																		//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;

		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);		 														//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_ToughGuy] = TRUE;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Piratensaebel);
	//EquipItem			(self, ItRw_Bow_H_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_Greg, BodyTex_P, ITAR_PIR_H_Addon);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1300;
};

FUNC VOID Rtn_Start_1300 ()
{
	TA_Stand_ArmsCrossed (08,00,22,00,"NW_FARM1_PATH_SPAWN_05");
    TA_Stand_ArmsCrossed (22,00,08,00,"NW_FARM1_PATH_SPAWN_05");		
};

FUNC VOID Rtn_Markt_1300 ()
{
	TA_Stand_Eating		(08,00,23,00,"MARKT"); 
    TA_Stand_Eating		(23,00,08,00,"MARKT");		
};


FUNC VOID Rtn_Taverne_1300 ()
{
	TA_Sit_Bench		(08,00,23,00,"NW_TAVERNE_GREGSBENCH"); 
    TA_Sit_Bench		(23,00,08,00,"NW_TAVERNE_GREGSBENCH");		
};


FUNC VOID Rtn_RakeCave_1300 ()
{
	TA_RangerMeeting	(08,00,23,00,"NW_BIGFARM_LAKE_CAVE_01"); 
    TA_RangerMeeting	(23,00,08,00,"NW_BIGFARM_LAKE_CAVE_01");		
};


FUNC VOID Rtn_Bigcross_1300 ()
{
	TA_Stand_Eating		(08,00,23,00,"BIGCROSS"); 
    TA_Stand_Eating		(23,00,08,00,"BIGCROSS");		
};


FUNC VOID Rtn_Dexter_1300 ()
{
	TA_Stand_WP		(08,00,23,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_03"); 
    TA_Stand_WP		(23,00,08,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");		
};

FUNC VOID Rtn_DexterHouseRun_1300 ()
{
	TA_RunToWP (00,00,12,00,"NW_CASTLEMINE_HUT_10");
	TA_RunToWP (12,00,00,00,"NW_CASTLEMINE_HUT_10");
};

FUNC VOID Rtn_DexterHouseWalk_1300 ()
{
	TA_Stand_WP (00,00,12,00,"NW_CASTLEMINE_HUT_10");
	TA_Stand_WP (12,00,00,00,"NW_CASTLEMINE_HUT_10");
};

FUNC VOID Rtn_DexterThrone_1300 ()
{
	TA_Sit_Throne (00,00,12,00,"NW_CASTLEMINE_HUT_10");
	TA_Sit_Throne (12,00,00,00,"NW_CASTLEMINE_HUT_10");
};

FUNC VOID Rtn_Tot_1300 ()
{
	TA_Sleep		(08,00,23,00,"TOT");
    TA_Sleep		(23,00,08,00,"TOT");		
};
