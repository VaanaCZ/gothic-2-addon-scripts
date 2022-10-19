
instance VLK_4100_Brutus (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brutus";
	guild 		= GIL_MIL;
	id 			= 4100;
	voice 		= 6;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	
	//------- Aivars 
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1H_Vlk_Dagger);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_ToughBald, BodyTex_P, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4100;
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN

FUNC VOID Rtn_Start_4100 ()
{	
	TA_Smith_Sharp			(08,00,23,00,"OC_FOLTER_SHARP");
    TA_Smith_Sharp			(23,00,08,00,"OC_FOLTER_SHARP");
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_Meatbugs_4100 ()
{	
	TA_Guard_Passage 		(08,00,23,00,"OC_BRUTUS_MEATBUGS"); 
    TA_Guard_Passage		(23,00,08,00,"OC_BRUTUS_MEATBUGS");
};

