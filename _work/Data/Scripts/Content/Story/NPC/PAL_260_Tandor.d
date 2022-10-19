
instance PAL_260_Tandor  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tandor";
	guild 		= GIL_PAL;
	id 			= 260;
	voice 		= 8;
	flags       = 0;																	
	npctype		= NPCTYPE_OCMAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);													
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Pal_Sword);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_P_Tough_Rodriguez, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_260;
};

FUNC VOID Rtn_Start_260 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OC_STAND_TANDOR_01");
    TA_Stand_Guarding		(23,00,08,00,"OC_STAND_TANDOR_01");
};

FUNC VOID Rtn_PostenVerlassen_260 ()
{	
	TA_Practice_Sword		(08,00,23,00,"OC_CENTER_03");
    TA_Stand_Eating			(23,00,08,00,"OC_CENTER_03");
};

