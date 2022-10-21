instance VLK_403_Gerbrandt (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gerbrandt"; 
	guild 		= GIL_VLK;
	id 			= 403;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self,ItMw_1h_Vlk_Mace);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItSe_GoldPocket100,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Tough_Santino, BodyTex_L, ITAR_VLK_H);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_403;
};

FUNC VOID Rtn_Start_403 ()
{	
	TA_Sleep		(22,00,08,00,"NW_CITY_GERBRANDT_BED_01");
	
	TA_Smalltalk	(08,00,11,00,"NW_CITY_SMALLTALK_02");
    TA_Sit_Bench 	(11,00,15,00,"NW_CITY_UPTOWN_PATH_23_B");
    TA_Smalltalk	(15,00,18,00,"NW_CITY_SMALLTALK_02");
	TA_Sit_Bench 	(18,00,22,00,"NW_CITY_UPTOWN_PATH_23_B");
};

FUNC VOID Rtn_WaitForDiego_403 ()
{	
	TA_Sleep		(22,00,08,00,"NW_CITY_GERBRANDT_BED_01");
	TA_Stand_WP		(08,00,22,00,"NW_CITY_UPTOWN_PATH_23");	 
};

FUNC VOID Rtn_NewLife_403 ()		
{	
	TA_Smalltalk	(22,00,08,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk	(08,00,11,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
    TA_Smalltalk 	(11,00,15,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
    TA_Smalltalk	(15,00,18,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	TA_Smalltalk 	(18,00,22,00,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
};
