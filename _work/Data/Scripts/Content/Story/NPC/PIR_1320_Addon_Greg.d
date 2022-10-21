instance PIR_1320_Addon_Greg (Npc_Default)
{
	// ------ NSC ------
	name 		= "Greg";
	guild 		= GIL_PIR;
	id 			= 1320;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;															
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
	daily_routine 		= Rtn_Start_1320;
};

FUNC VOID Rtn_Start_1320 ()
{
	TA_Stand_WP 	(05,00,20,00,"ADW_PIRATECAMP_GREG");
	TA_Stand_WP		(20,00,05,00,"ADW_PIRATECAMP_GREG");
};

FUNC VOID Rtn_HOME_1320 ()
{
	TA_Sit_Bench		(22,00,12,00,"ADW_PIRATECAMP_HUT4_01");
	TA_Sit_Bench		(12,00,22,00,"ADW_PIRATECAMP_HUT4_01");
};
