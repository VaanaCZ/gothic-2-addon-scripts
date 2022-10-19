
instance SLD_823_Khaled (Npc_Default)
{
	// ------ NSC ------
	name 		= "Khaled"; 
	guild 		= GIL_SLD;
	id 			= 823;
	voice 		= 11;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_2h_Sld_Axe);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_B_Thorus, BodyTex_B, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_823;
};

FUNC VOID Rtn_Start_823 ()
{
	TA_Stand_Guarding		(07,55,21,55,"NW_BIGFARM_HOUSE_12");
    TA_Stand_Eating			(21,55,23,55,"NW_BIGFARM_HOUSE_UP2_06");
    TA_Sleep				(23,55,07,55,"NW_BIGFARM_HOUSE_UP2_02");
};

