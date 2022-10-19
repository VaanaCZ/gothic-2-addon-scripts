
instance Mil_320_Miliz (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Miliz;	
	guild 		= GIL_MIL;
	id 			= 320;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Drax, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,-1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_320;
};

FUNC VOID Rtn_Start_320()
{	
	TA_Stand_Guarding	(05,00,20,15,"NW_CITY_MERCHANT_PATH_27");
    TA_Stand_Guarding	(20,15,22,15,"NW_CITY_MERCHANT_PATH_36");
    TA_Stand_Guarding	(22,15,00,15,"NW_CITY_MERCHANT_PATH_27");
    TA_Stand_Guarding	(00,15,02,15,"NW_CITY_MERCHANT_PATH_36");
    TA_Stand_Guarding	(02,15,04,15,"NW_CITY_MERCHANT_PATH_27");
    TA_Stand_Guarding	(04,15,05,00,"NW_CITY_MERCHANT_PATH_36");
};
