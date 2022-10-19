

instance DJG_705_Angar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Angar";
	guild 		= GIL_DJG;
	id 			= 7050;
	voice 		= 4;
	flags       = 0;					//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_CorAngar, BodyTex_B, ITAR_CorAngar);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7050;
};

FUNC VOID Rtn_Start_7050 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"FARM3");
    TA_Stand_ArmsCrossed					(23,00,08,00,"FARM3");		
};

FUNC VOID Rtn_WaitForShip_7050 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"NW_WAITFOR_SHIP_03");
    TA_Stand_ArmsCrossed					(23,00,08,00,"NW_WAITFOR_SHIP_03");		
};

FUNC VOID Rtn_Ship_7050 ()
{
	TA_Stand_ArmsCrossed					(08,00,23,00,"SHIP_CREW_03");
    TA_Stand_ArmsCrossed					(23,00,08,00,"SHIP_CREW_03");		
};
