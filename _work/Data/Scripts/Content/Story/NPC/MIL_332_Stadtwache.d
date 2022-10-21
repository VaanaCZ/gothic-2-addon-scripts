
instance Mil_332_Stadtwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Stadtwache;	
	guild 		= GIL_MIL;
	id 			= 332;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Stone, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_332;
};

FUNC VOID Rtn_Start_332 ()
{	
	TA_Stand_WP		(08,00,22,00,"NW_CITY_ENTRANCE_BACK_GUARD_01");
    TA_Stand_WP		(22,00,08,00,"NW_CITY_ENTRANCE_BACK_GUARD_01");
};
