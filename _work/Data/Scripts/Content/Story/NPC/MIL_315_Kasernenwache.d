
instance Mil_315_Kasernenwache (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Miliz;	// Kasernenwache
	guild 		= GIL_MIL;
	id 			= 315;
	voice 		= 7;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Tough_Skip, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_315;
};

FUNC VOID Rtn_Start_315 ()
{	
	TA_Smith_Sharp		(07,05,20,59,"NW_CITY_KASERN_ARMORY_SHARP");
	TA_Sit_Campfire		(20,59,00,03,"NW_CITY_BARRACK02_SMALLTALK_01");
    TA_Sleep			(00,03,07,05,"NW_CITY_BARRACK01_BED_RUGA");
};
