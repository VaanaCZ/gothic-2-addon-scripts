
instance VLK_426_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 426;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Vlk_Dagger);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_426;
};

FUNC VOID Rtn_Start_426 ()
{	
	TA_Stand_ArmsCrossed	(05,05,20,05,"NW_CITY_MERCHANT_PATH_15");
    TA_Smalltalk			(20,05,03,55,"NW_CITY_MERCHANT_TAVERN01_01");
    TA_Smalltalk			(03,55,05,05,"NW_CITY_TAVERN_IN_05");
};

FUNC VOID Rtn_VatrasAway_426 ()
{	
	TA_Smalltalk			(05,05,20,00,"NW_CITY_MERCHANT_STAND_01");
    TA_Smalltalk			(20,00,05,05,"NW_CITY_MERCHANT_TAVERN01_01");
};
