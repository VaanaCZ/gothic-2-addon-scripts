//#############################################
//##
//##	Neue Welt
//##
//############################################

instance SLD_800_Lee (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lee";
	guild 		= GIL_SLD;
	id 			= 800;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: IMMORTAL																		//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_2h_Sld_Sword);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Lee, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_800;
};

FUNC VOID Rtn_Start_800 ()
{
	TA_Stand_Guarding		(08,00,19,00,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	TA_Sit_Chair			(19,00,22,00,"NW_BIGFARM_HOUSE_UP2_05");
    TA_Sleep				(22,00,08,00,"NW_BIGFARM_HOUSE_UP2_04");	
};

FUNC VOID Rtn_WaitForShip_800 ()
{
	TA_Stand_Guarding		(08,00,19,00,"NW_WAITFOR_SHIP_01");
	TA_Stand_Guarding		(19,00,08,00,"NW_WAITFOR_SHIP_01");	
};

FUNC VOID Rtn_ShipOff_800 ()
{
	TA_Stand_Guarding		(08,00,19,00,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	TA_Sit_Chair			(19,00,22,00,"NW_BIGFARM_HOUSE_UP2_05");
    TA_Sleep				(22,00,08,00,"NW_BIGFARM_HOUSE_UP2_04");	
};

FUNC VOID Rtn_Ship_800 ()
{
	TA_Stand_Guarding			(08,00,23,00,"SHIP_CREW_01");
	TA_Sleep					(23,00,08,00,"SHIP_IN_06");
};
