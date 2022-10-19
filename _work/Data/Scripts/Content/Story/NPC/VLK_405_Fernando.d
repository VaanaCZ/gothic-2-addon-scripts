instance VLK_405_Fernando (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fernando"; 
	guild 		= GIL_VLK;
	id 			= 405;
	voice 		= 14;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Corristo, BodyTex_N, ITAR_Governor);	
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_405;
};

//Joly: NIE AUF EINE BANK ODER THRON SETZEN

FUNC VOID Rtn_Start_405 ()
{	
	TA_Sleep				(22,05,07,59,"NW_CITY_REICH02_BED_01");
	TA_Smalltalk			(07,59,11,00,"NW_CITY_UPTOWN_PATH_08");
	TA_Stand_WP				(11,00,14,59,"NW_CITY_UPTOWN_PATH_04");
	TA_Smalltalk			(14,59,18,00,"NW_CITY_UPTOWN_PATH_08");
	TA_Read_Bookstand 		(18,00,20,00,"NW_CITY_REICH02_READ");
	TA_Read_Bookstand		(20,00,22,05,"NW_CITY_REICH02_READ");
};

//Joly: NIE AUF EINE BANK ODER THRON SETZEN

FUNC VOID Rtn_Wait_405 ()
{	
	TA_Smalltalk	(07,59,11,00,"NW_CITY_UPTOWN_PATH_08");
	TA_Stand_WP		(11,00,14,59,"NW_CITY_UPTOWN_PATH_04");
	TA_Smalltalk	(14,59,18,00,"NW_CITY_UPTOWN_PATH_08");
	TA_Stand_WP		(18,00,07,59,"NW_CITY_UPTOWN_PATH_04");
};

FUNC VOID Rtn_Prison_405 ()
{	
	TA_Stand_ArmsCrossed 	(08,00,23,00,"NW_CITY_HABOUR_KASERN_RENGARU");
    TA_Stand_ArmsCrossed	(23,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU"); 
};
