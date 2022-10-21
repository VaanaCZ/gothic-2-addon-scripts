//#############################################
//##
//##	Neue Welt
//##
//#############################################

instance VLK_4250_Jorgen (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jorgen";
	guild 		= GIL_NONE;
	id 			= 4250;
	voice 		= 7;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: Immortal Kapitän fürs Schiff im Kapitel 5! Mortal, Optionale Kapitäne: Torlof und Jack!!!!!!!!!						
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);													
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------														
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Tough_Skip, BodyTex_N, ITAR_VLK_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4250;
};

FUNC VOID Rtn_Start_4250 ()
{
	TA_Stand_ArmsCrossed 			(08,00,20,00,"NW_MONASTERY_BRIDGE_01");
    TA_Stand_ArmsCrossed 			(20,00,08,00,"NW_MONASTERY_BRIDGE_01");		
};

FUNC VOID Rtn_Kloster_4250 ()
{
	TA_Stand_ArmsCrossed 			(08,00,20,00,"NW_MONASTERY_PLACE_06");
    TA_Sleep			 			(20,00,08,00,"NW_MONASTERY_NOVICE04_06");		
};
FUNC VOID Rtn_RausAusKloster_4250 ()
{
	TA_Stand_ArmsCrossed 			(08,00,20,00,"NW_BIGFARM_KITCHEN_OUT_06");
    TA_Stand_ArmsCrossed 			(20,00,08,00,"NW_BIGFARM_KITCHEN_OUT_06");		
};

FUNC VOID Rtn_WaitForShipCaptain_4250 ()
{
	TA_Sit_Bench 			(08,00,20,00,"NW_WAITFOR_SHIP_CAPTAIN"); 
    TA_Sit_Bench 			(20,00,08,00,"NW_WAITFOR_SHIP_CAPTAIN");	
};

FUNC VOID Rtn_AllOnBoard_4250 ()
{
	TA_Stand_WP			(08,00,23,00,"SHIP_CREW_CAPTAIN");
	TA_Sleep			(23,00,08,00,"SHIP_IN_06");
};
