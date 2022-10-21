//#############################################
//##
//##	Neue Welt
//##
//############################################

instance None_101_Mario (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mario";
	guild 		= GIL_NONE;
	id 			= 101;
	voice 		= 7;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL	sonst Plottkiller Kapitel 5																//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_2h_SLD_SWORD);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Kirgo, BodyTex_B, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1.2);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 85); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_101;
};

FUNC VOID Rtn_Start_101 ()
{	
	TA_Stand_Drinking		(08,00,21,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
   	TA_Stand_Drinking		(21,00,08,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

FUNC VOID Rtn_WaitForShip_101 ()
{	
	TA_Stand_Drinking		(08,00,19,00,"NW_WAITFOR_SHIP_01");
	TA_Stand_Drinking		(19,00,08,00,"NW_WAITFOR_SHIP_01");	
};

FUNC VOID Rtn_ShipOff_101 ()
{	
	TA_Stand_Drinking		(08,00,21,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
   	TA_Stand_Drinking		(21,00,08,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

FUNC VOID Rtn_Ship_101 ()
{	
	TA_Sit_Bench			(08,00,23,00,"SHIP_DECK_25");
	TA_Sit_Bench			(23,00,08,00,"SHIP_DECK_25");
};
