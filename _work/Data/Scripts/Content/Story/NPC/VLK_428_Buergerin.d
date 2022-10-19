
instance VLK_428_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 428;
	voice 		= 16;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_428;
};

FUNC VOID Rtn_Start_428 ()
{	
	TA_Stand_ArmsCrossed	(05,10,20,17,"NW_CITY_MERCHANT_PATH_14_C");
    TA_Smalltalk			(20,17,05,10,"NW_CITY_MERCHANT_PATH_32");
};

FUNC VOID Rtn_VatrasAway_428 ()
{	
	TA_Smalltalk			(05,10,20,17,"NW_CITY_MERCHANT_PATH_14_A");
    TA_Smalltalk			(20,17,05,10,"NW_CITY_MERCHANT_PATH_32");
};
