
instance VLK_454_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_VLK;
	id 			= 454;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Vlk_Mace);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_454;
};

FUNC VOID Rtn_Start_454()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"NW_CITY_MERCHANT_PATH_14_C");
    TA_Smoke_Waterpipe		(20,15,01,15,"NW_CITY_RAUCH_03");
    TA_Sit_Chair			(01,15,05,15,"NW_CITY_TAVERN_IN_01");
};

FUNC VOID Rtn_VatrasAway_454()
{	
	TA_Sit_Chair			(05,15,20,15,"NW_CITY_TAVERN_IN_01");
    TA_Smoke_Waterpipe		(20,15,01,15,"NW_CITY_RAUCH_03");
    TA_Sit_Chair			(01,15,05,15,"NW_CITY_TAVERN_IN_01");
};
