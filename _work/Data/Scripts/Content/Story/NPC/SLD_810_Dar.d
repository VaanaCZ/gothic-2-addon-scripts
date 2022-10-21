
instance SLD_810_Dar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dar";
	guild 		= GIL_SLD;
	id 			= 810;
	voice 		= 3;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars -------
	aivar[AIV_ToughGuyNewsOverride] = TRUE; //wegen Stimme!
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	EquipItem			(self, ItRw_Sld_Bow);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMi_Joint, 10);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal_Spassvogel, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_810;
};

FUNC VOID Rtn_PreStart_810 ()
{
	TA_Smoke_Joint			(08,00,22,00,"NW_BIGFARM_KITCHEN_DAR");
 	TA_Smoke_Joint			(22,00,08,00,"NW_BIGFARM_KITCHEN_DAR");		
};

FUNC VOID Rtn_Start_810 ()
{
	TA_Smoke_Joint			(08,00,22,00,"NW_BIGFARM_KITCHEN_DAR");
    TA_Sit_Chair			(22,00,08,00,"NW_BIGFARM_HOUSE_12");			
};
