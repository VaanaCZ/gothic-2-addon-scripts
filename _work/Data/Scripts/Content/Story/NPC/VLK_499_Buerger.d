
instance VLK_499_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buerger; 
	guild 		= GIL_VLK;
	id 			= 499;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self,ItMw_1h_Vlk_Mace);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_BaalNetbek, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_499;
};

FUNC VOID Rtn_Start_499()
{	
	TA_Stand_Eating 	(06,00,08,00,"NW_CITY_MERCHANT_TRADE_04");
	TA_Stand_Drinking	(08,00,10,00,"NW_CITY_UPTOWN_PATH_27");
	TA_Stand_Eating 	(10,00,12,00,"NW_CITY_MERCHANT_TRADE_04");
	TA_Sit_Bench		(12,00,14,00,"NW_CITY_UPTOWN_PATH_03_C");
	TA_Stand_Eating 	(14,00,16,00,"NW_CITY_MERCHANT_TRADE_04");
	TA_Sit_Bench		(16,00,18,00,"NW_CITY_GUARD_01");
	TA_Stand_Eating 	(18,00,19,55,"NW_CITY_MERCHANT_TRADE_04");
	TA_Sit_Bench		(19,55,22,00,"NW_CITY_GUARD_01");

	TA_Sleep			(22,00,06,00,"NW_CITY_UPTOWN_HUT_BED_02"); //reich05
};
