
instance DJG_712_Hokurn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hokurn"; 
	guild 		= GIL_DJG;
	id 			= 712;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	EquipItem			(self, ItRw_Crossbow_M_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B, ITAR_DJG_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_712;
};

FUNC VOID Rtn_PreStart_712 ()
{
	TA_Smalltalk				(08,00,23,00,"OW_DJG_STARTCAMP_01");
    TA_Smalltalk				(23,00,08,00,"OW_DJG_STARTCAMP_01");		
};

FUNC VOID Rtn_Start_712 ()
{
	TA_Smalltalk 						(08,00,23,00,"SPAWN_OW_BLACKGOBBO_A1");
    TA_Smalltalk						(23,00,08,00,"SPAWN_OW_BLACKGOBBO_A1");		
};

