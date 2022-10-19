
instance VLK_456_Abuyin (Npc_Default)
{
	// ------ NSC ------
	name 		= "Abuyin"; 
	guild 		= GIL_VLK;
	id 			= 456;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Dagger);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_456;
};

FUNC VOID Rtn_Start_456()
{	
	TA_Stand_ArmsCrossed 		(07,20,01,20,"NW_CITY_MERCHANT_BENCH_02");
    TA_Sleep					(01,20,07,20,"NW_CITY_HOTEL_BED_05");
};
