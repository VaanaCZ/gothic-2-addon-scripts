
//#############################################
//##
//##	Dracheninsel
//##
//############################################

instance None_101_Mario_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mario";
	guild 		= GIL_DMT;
	id 			= 1010;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_EnemyOverride] 		= TRUE;
	aivar[AIV_MagicUser] 			= MAGIC_NEVER;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Sturmbringer);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems 		(self, ITWR_DementorObsessionBook_MIS, 1 );	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Kirgo, BodyTex_B, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1.2);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 95); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1010;
};

FUNC VOID Rtn_Start_1010 ()
{	
	TA_Sit_Bench			(08,00,23,00,"SHIP_DECK_25");
	TA_Sit_Bench			(23,00,08,00,"SHIP_DECK_25");
};

FUNC VOID Rtn_OrkSturmDI_1010 ()
{	
	TA_Stand_ArmsCrossed			(08,00,23,00,"DI_MARIO_AMBUSH");
	TA_Stand_ArmsCrossed			(23,00,08,00,"DI_MARIO_AMBUSH");
};
