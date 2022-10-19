
instance VLK_4130_Talbin (Npc_Default)
{
	// ------ NSC ------
	name 		= "Talbin";
	guild 		= GIL_OUT;
	id 			= 4130;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;	//Joly: flieht mit dem sc aus dem minental!
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	EquipItem			(self, ItRW_SLD_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Bullit, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4130;
};

FUNC VOID Rtn_Start_4130 ()
{	
	TA_Sit_Campfire	(08,00,23,00,"SPAWN_TALL_PATH_BANDITOS2_03");
    TA_Sit_Campfire	(23,00,08,00,"SPAWN_TALL_PATH_BANDITOS2_03");
};

FUNC VOID Rtn_FleePass_4130 ()
{	
	TA_RunToWP 	(08,00,23,00,"START");
    TA_RunToWP	(23,00,08,00,"START");
};


FUNC VOID Rtn_IntoPass_4130 ()
{	
	TA_Stand_Eating 	(08,00,23,00,"TOT");
    TA_Stand_Eating		(23,00,08,00,"TOT");
};

