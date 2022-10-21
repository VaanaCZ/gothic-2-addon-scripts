

instance SLD_816_Fester (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fester";
	guild 		= GIL_SLD;
	id 			= 816;
	voice 		= 8;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND; //weil sonst FK-Waffe zu "Steck die Waffe weg" führt, wenn Fester mit dir losgeht (kein Partymember!)
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItMw_1h_Sld_Axe);
	EquipItem (self, ItRw_Sld_Bow);
	CreateInvItems (self, itrw_arrow, 10);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart05, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	// guter Bogenkämpfer
	B_AddFightSkill (self, NPC_TALENT_BOW, 30); //ADD!!!
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_816;
};

FUNC VOID Rtn_Start_816 ()
{
	TA_Practice_Sword 		(05,00,06,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(06,00,07,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(07,00,08,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(08,00,09,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(09,00,10,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(10,00,11,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(11,00,12,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(12,00,13,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(13,00,14,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(14,00,15,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(15,00,16,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(16,00,17,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(17,00,18,00,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword 		(18,00,19,00,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword		(19,00,20,00,"NW_BIGFARM_ALLEE_04");
	
	TA_Sit_Campfire 		(20,00,06,00,"NW_BIGFARM_VORPOSTEN1_01");
};

FUNC VOID Rtn_Guide_816 ()
{
	TA_Guide_Player			(08,00,20,00,"NW_BIGFARM_FELDREUBER4");
    TA_Guide_Player			(20,00,08,00,"NW_BIGFARM_FELDREUBER4");	
};
