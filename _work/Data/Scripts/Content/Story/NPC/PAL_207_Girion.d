
instance Pal_207_Girion (Npc_Default)
{
	// ------ NSC ------
	name 		= "Girion";
	guild 		= GIL_PAL;
	id 			= 207;
	voice 		= 8;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1H_Pal_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Lefty, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_207;
};

FUNC VOID Rtn_Start_207 ()
{
    TA_Practice_Sword		(06,00,07,03,"NW_CITY_GIRION");	
    TA_Stand_ArmsCrossed	(07,03,19,00,"NW_CITY_GIRION");
    TA_Sit_Throne			(19,00,22,59,"NW_CITY_UPTOWN_HUT_03_SIT");
    TA_Sleep				(22,59,06,00,"NW_CITY_LEOMAR_BED_02");	
};


FUNC VOID Rtn_WaitForShip_207 ()
{
	TA_Stand_WP			(08,00,23,00,"NW_CITY_WAY_TO_SHIP_25");
	TA_Stand_WP			(23,00,08,00,"NW_CITY_WAY_TO_SHIP_25");
};

FUNC VOID Rtn_Ship_207 ()
{
	TA_Sit_Bench			(08,00,23,00,"SHIP_DECK_18");
	TA_Sit_Bench			(23,00,08,00,"SHIP_DECK_18");
};
