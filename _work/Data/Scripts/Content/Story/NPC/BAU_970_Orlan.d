

instance BAU_970_Orlan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Orlan";
	guild 		= GIL_NONE;
	id 			= 970;
	voice 		= 5;
	flags       = NPC_FLAG_IMMORTAL;	//Joly:bis das Ranger treffen war.																//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Vlk_Dagger);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_B_Normal_Sharky, BodyTex_B, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_970;
};

FUNC VOID Rtn_Start_970 ()
{	
	TA_Stand_WP		(08,00,22,00,"NW_TAVERNE_IN_04");  
    TA_Stand_WP		(22,00,08,00,"NW_TAVERNE_IN_04");
};


FUNC VOID Rtn_Wettkampf_970 ()
{	
	TA_Stand_WP  	(08,00,22,00,"NW_TAVERNE");	
    TA_Stand_WP 	(22,00,08,00,"NW_TAVERNE");
};

FUNC VOID Rtn_RangerMeeting_970 ()
{	
	TA_RangerMeeting  	(08,00,22,00,"NW_TAVERNE_IN_RANGERMEETING");	
    TA_RangerMeeting 	(22,00,08,00,"NW_TAVERNE_IN_RANGERMEETING");
};
FUNC VOID Rtn_Parking_970 ()
{	
	TA_Stand_Guarding   (08,00,22,00,"NW_TAVERNE_IN_RANGERMEETING");	
    TA_Stand_Guarding 	(22,00,08,00,"NW_TAVERNE_IN_RANGERMEETING");
};
