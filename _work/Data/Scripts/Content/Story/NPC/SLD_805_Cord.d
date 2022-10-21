
instance SLD_805_Cord (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cord";
	guild 		= GIL_NONE;
	id 			= 805;
	voice 		= 14;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Cord, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_805;
};

FUNC VOID Rtn_Start_805 ()
{
	TA_Practice_Sword 	(07,40,22,40,"NW_BIGFARM_CORD");
    TA_Sleep			(22,40,07,40,"NW_BIGFARM_HOUSE_08");
};

FUNC VOID Rtn_PreRangerMeeting_805 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_04");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_04");
};

FUNC VOID Rtn_RangerMeeting_805 ()
{	
	TA_RangerMeeting	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_RangerMeeting	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Parking_805 ()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_ArmsCrossed	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

