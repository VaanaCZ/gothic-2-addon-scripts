

instance SLD_807_Bullco (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bullko";
	guild 		= GIL_SLD;
	id 			= 807;
	voice 		= 6;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ----- aivars -----
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller]  	= TRUE;
	aivar[AIV_IGNORE_Theft]			= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Axe);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N, ITAR_SLD_M);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_807;
};

FUNC VOID Rtn_Start_807 ()
{
	TA_Sit_Chair	(08,00,22,00,"NW_BIGFARM_KITCHEN_SYLVIO");
    TA_Sit_Chair	(22,00,08,00,"NW_BIGFARM_KITCHEN_SYLVIO");			
};

func void Rtn_Pee_807 ()
{
	TA_Pee			(08,00,08,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(08,15,10,00,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee			(10,00,10,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(10,15,12,00,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee			(12,00,12,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(12,15,14,00,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee			(14,00,14,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(14,15,16,00,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee			(16,00,16,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(16,15,18,00,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee			(18,00,18,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(18,15,20,00,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee			(20,00,20,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair	(20,15,08,00,"NW_BIGFARM_KITCHEN_SYLVIO");
};

FUNC VOID Rtn_Tot_807 ()
{
	TA_Sleep		(08,00,23,00,"TOT");
    TA_Sleep		(23,00,08,00,"TOT");		
};






