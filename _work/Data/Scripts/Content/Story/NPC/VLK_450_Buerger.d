
instance VLK_450_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_VLK;
	id 			= 450;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_450;
};

FUNC VOID Rtn_Start_450()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Smalltalk			(20,00,03,50,"NW_CITY_MERCHANT_STAND_01");
    TA_Smalltalk			(03,50,05,00,"NW_CITY_TAVERN_IN_06");
};


FUNC VOID Rtn_VatrasAway_450()
{	
	TA_Smalltalk			(05,00,20,00,"NW_CITY_MERCHANT_PATH_14");
	TA_Smalltalk			(20,00,05,00,"NW_CITY_MERCHANT_STAND_01");
    
};
