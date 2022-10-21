
instance DJG_708_Kurgan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kurgan";
	guild 		= GIL_DJG;
	id 			= 708;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	EquipItem			(self, ItRw_Crossbow_M_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_ImportantGrey, BodyTex_N, ITAR_DJG_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_708;
};

FUNC VOID Rtn_PreStart_708()
{
	TA_Stand_Guarding						(08,00,23,00,"OW_PATH_1_5_4");
    TA_Stand_Guarding						(23,00,08,00,"OW_PATH_1_5_4");	
};

FUNC VOID Rtn_Start_708()
{
	TA_Stand_Guarding						(08,00,23,00,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
    TA_Stand_Guarding						(23,00,08,00,"OW_MOVEMENT_LURKER_NEARBGOBBO03");	
};
