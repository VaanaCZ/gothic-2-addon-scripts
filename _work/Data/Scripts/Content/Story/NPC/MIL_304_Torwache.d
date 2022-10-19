
instance Mil_304_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_TORWACHE; 	
	guild 		= GIL_MIL;
	id 			= 304;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal16, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_304;
};

FUNC VOID Rtn_Start_304 ()
{	
	TA_Stand_WP			(08,00,22,00,"NW_CITY_UPTOWN_GUARD_01");
    TA_Stand_WP			(22,00,08,00,"NW_CITY_UPTOWN_GUARD_01");
};
