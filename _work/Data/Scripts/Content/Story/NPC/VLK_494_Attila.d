
instance VLK_494_Attila (Npc_Default)
{
	// ------ NSC ------
	name 		= "Attila";
	guild 		= GIL_VLK;
	id 			= 494;
	voice 		= 9;
	flags       = 0;									//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	//---------- Aivars ------------------
	aivar[AIV_DropDeadAndKill] = TRUE;
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Axe);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	CreateInvItem (self, ItKe_ThiefGuildKey_MIS);  // Schlüssel zur geheimen Diebesgilde
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough_Santino, BodyTex_L, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA ------
	daily_routine 		= Rtn_Start_494;
};

FUNC VOID Rtn_Start_494 ()
{	
	TA_Stand_Guarding (04,00,22,00,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");	
    TA_Stand_Guarding (22,00,04,00,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02"); 
};
FUNC VOID Rtn_After_494 ()
{	
	TA_Stand_Guarding (04,00,22,00,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");	
    TA_Stand_Guarding (22,00,04,00,"NW_CITY_HABOUR_POOR_AREA_CAULDRON"); 
};
