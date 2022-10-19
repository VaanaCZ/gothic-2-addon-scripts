
instance DJG_703_Cipher (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cipher";
	guild 		= GIL_DJG;
	id 			= 703;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	EquipItem			(self, ItRw_Crossbow_M_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItPo_Health_02, 6);									
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit man seine Leiche findet, wenn er im Kampf stirbt!									
	
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_DJG_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_703;
};

FUNC VOID Rtn_Start_703 ()
{
	TA_Sit_Bench				(08,00,23,00,"OW_DJG_SWAMPCAMP_02");
    TA_Sit_Bench				(23,00,08,00,"OW_DJG_SWAMPCAMP_03");		
};

FUNC VOID Rtn_SwampWait1_703 ()
{
	TA_Guide_Player				(08,00,23,00,"OW_DJG_SWAMP_WAIT1_01");
    TA_Guide_Player				(23,00,08,00,"OW_DJG_SWAMP_WAIT1_01");		
};

FUNC VOID Rtn_SwampWait2_703 ()
{
	TA_RunToWP 				(08,00,23,00,"OW_DJG_SWAMP_WAIT2_01");	//Joly: TA_RunToWP  Sonst folgt er SC zum Drachen, ohne dass SC mit ihm gesprochen hat
    TA_RunToWP 				(23,00,08,00,"OW_DJG_SWAMP_WAIT2_01");		
};


FUNC VOID Rtn_SwampDragon_703 ()
{
	TA_RunToWP				(08,00,23,00,"OW_DRAGONSWAMP_009");
    TA_RunToWP				(23,00,08,00,"OW_DRAGONSWAMP_009");		
};
