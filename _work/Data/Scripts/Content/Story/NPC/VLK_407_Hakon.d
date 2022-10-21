
instance VLK_407_Hakon (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hakon";
	guild 		= GIL_VLK;
	id 			= 407;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_ShortSword2);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart20, BodyTex_N, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_407;
};

FUNC VOID Rtn_Start_407 ()
{	
	TA_Stand_ArmsCrossed	(05,10,19,50,"NW_CITY_HAKON");
    TA_Smoke_Waterpipe 		(19,50,00,10,"NW_CITY_RAUCH_02");
    TA_Sleep				(00,10,05,10,"NW_CITY_HOTEL_BED_04");
};
