
instance Mil_305_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_TORWACHE; 	
	guild 		= GIL_MIL;
	id 			= 305;
	voice 		= 3;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal01, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_305;
};

FUNC VOID Rtn_Start_305 ()
{	
	TA_Guard_Passage		(08,00,22,00,"NW_CITY_UPTOWN_GUARD_02");
    TA_Guard_Passage		(22,00,08,00,"NW_CITY_UPTOWN_GUARD_02");
};
