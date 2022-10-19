

instance DJG_701_Bullco (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bullko";
	guild 		= GIL_DJG;
	id 			= 701;
	voice 		= 6;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N, ITAR_DJG_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_701;
};

FUNC VOID Rtn_Start_701 ()
{
	TA_Sit_Bench						(08,00,23,00,"OW_DJG_ICECAMP_02");
    TA_Sit_Bench						(23,00,08,00,"OW_DJG_ICECAMP_02");		
};

FUNC VOID Rtn_IceWait1_701 ()
{
	TA_Stand_ArmsCrossed					(00,00,	23,00,"OW_ICEREGION_ENTRANCE");    
	TA_Stand_ArmsCrossed					(23,00,	24,00,"OW_ICEREGION_ENTRANCE");     
};

FUNC VOID Rtn_IceWait2_701 ()
{
	TA_Stand_ArmsCrossed					(00,00,	23,00,"OW_DJG_ICEREGION_WAIT2_02");    
	TA_Stand_ArmsCrossed					(23,00,	24,00,"OW_DJG_ICEREGION_WAIT2_02");     
};

FUNC VOID Rtn_IceDragon_701 ()
{
	TA_Stand_ArmsCrossed					(00,00,	23,00,"OW_ICEDRAGON_02");    
	TA_Stand_ArmsCrossed					(23,00,	24,00,"OW_ICEDRAGON_02");     
};

FUNC VOID Rtn_DJGVorposten_701 ()
{
	TA_Stand_ArmsCrossed		(00,00,	23,00,"OW_MOVEMENT_BGOBBO1");    
	TA_Stand_ArmsCrossed		(23,00,	24,00,"OW_MOVEMENT_BGOBBO1");     
};
FUNC VOID Rtn_Follow_701 ()
{
	TA_Follow_Player 		(00,00,	23,00,"SPAWN_OW_BLACKGOBBO_A1");    
	TA_Follow_Player		(23,00,	24,00,"SPAWN_OW_BLACKGOBBO_A1");     
};




