
instance Pal_240_Ritter (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 240;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal20, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_240;
};

FUNC VOID Rtn_Start_240 ()
{
	TA_Stand_Guarding 	(06,00,07,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(07,00,08,00,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding	(08,00,09,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(09,00,10,00,"NW_CITY_WAY_TO_SHIP_23");
	
	TA_Stand_Guarding	(10,00,11,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(11,00,12,00,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding	(12,00,13,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(13,00,14,00,"NW_CITY_WAY_TO_SHIP_23");
	
	TA_Stand_Guarding	(14,00,15,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(15,00,16,00,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding	(16,00,17,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(17,00,18,00,"NW_CITY_WAY_TO_SHIP_23");
	
	TA_Stand_Guarding	(18,00,19,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(19,00,20,00,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding	(20,00,21,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(21,00,22,00,"NW_CITY_WAY_TO_SHIP_23");
	
	TA_Stand_Guarding	(22,00,23,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(23,00,00,00,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding	(00,00,01,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(01,00,02,00,"NW_CITY_WAY_TO_SHIP_23");
	
	TA_Stand_Guarding	(02,00,03,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(03,00,04,00,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding	(04,00,05,00,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding	(05,00,06,00,"NW_CITY_WAY_TO_SHIP_23");
};


FUNC VOID Rtn_ShipFree_240 ()
{
	TA_Stand_WP	(08,00,23,00,"NW_CITY_UPTOWNPARADE_04");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_UPTOWNPARADE_04");	
};
