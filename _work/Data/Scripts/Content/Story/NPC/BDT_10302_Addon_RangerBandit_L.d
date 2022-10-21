
instance BDT_10302_Addon_RangerBandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT; 
	guild 		= GIL_BDT;
	id 			= 10302;
	voice 		= 1;
	flags       = 0;									//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Addon_BanditTrader);
	//EquipItem			(self, ItRw_SLD_Bow);
	CreateInvItems (self, ItWr_StonePlateCommon_Addon, 1);	//Joly: will Erol wieder haben!								
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal04, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA ------
	daily_routine 		= Rtn_Start_10302;
};

FUNC VOID Rtn_Start_10302 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,23,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_01"); 
    TA_Stand_ArmsCrossed	(23,00,08,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
};

