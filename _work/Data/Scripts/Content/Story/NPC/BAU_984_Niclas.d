INSTANCE BAU_984_Niclas (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niclas";
	guild 		= GIL_OUT;
	id 			= 984;
	voice 		= 03;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_SLD_Sword);
	EquipItem 	(self,itRw_SLD_BOW); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_NormalBart12, BodyTex_N, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_984;
};

FUNC VOID Rtn_Start_984 ()
{	
	TA_Sit_Bench 		(08,00,23,00,"NW_CITY_JAEGER_SIT"); 
    TA_Sit_Bench		(23,00,08,00,"NW_CITY_JAEGER_SIT");
};
