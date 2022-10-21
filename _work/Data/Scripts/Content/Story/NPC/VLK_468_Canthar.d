
instance VLK_468_Canthar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Canthar"; 
	guild 		= GIL_NONE;
	id 			= 468;
	voice 		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_SWORD); 
	
	// ------ Inventory ------
	//CreateInvItems (self, ItWr_Passierschein, 1);wird jetzt über Dialog vergeben, damit nicht mehr im Trade auftaucht 
	CreateInvItems (self, ItMi_Gold, 50);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Orry, BodyTex_N, ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_468;
};

FUNC VOID Rtn_PreStart_468()
{	
	TA_Sit_Bench	(08,00,23,00,"NW_FARM1_PATH_CITY_SHEEP_05");
   	TA_Sit_Bench	(23,00,08,00,"NW_FARM1_PATH_CITY_SHEEP_05");
};

FUNC VOID Rtn_Start_468()
{	
	TA_Sit_Bench		(07,45,19,45,"NW_CITY_MERCHANT_PATH_30");
	TA_Smoke_Waterpipe  (19,45,00,45,"NW_CITY_RAUCH_05");
   	TA_Sleep			(00,45,07,45,"NW_CITY_HOTEL_BED_01");
};

FUNC VOID Rtn_Marktstand_468()
{	
	TA_Stand_ArmsCrossed 	(07,45,19,45,"NW_CITY_SARAH"); 
    TA_Smoke_Waterpipe  	(19,45,00,45,"NW_CITY_RAUCH_05");
   	TA_Sleep				(00,45,07,45,"NW_CITY_HOTEL_BED_01");
};

FUNC VOID Rtn_Knast_468()
{	
	TA_Sit_Bench 	(08,00,23,00,"NW_CITY_HABOUR_KASERN_RENGARU");
    TA_Sit_Bench	(23,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU");
};
