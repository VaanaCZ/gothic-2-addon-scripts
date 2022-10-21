
instance Mil_306_Tuerwache (Npc_Default)
{
	// ------ NSC ------
	name 		= "Richterhaus Wache"; 	
	guild 		= GIL_MIL;
	id 			= 306;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_ToughBald01, BodyTex_L, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_306;
};

FUNC VOID Rtn_Start_306 ()
{	
	TA_Stand_Guarding	(08,00,18,45,"NW_CITY_JUDGE_GUARD_01");
	TA_Stand_Guarding	(18,45,22,00,"NW_CITY_UPTOWN_JUDGE_01");
    TA_Stand_Guarding	(22,00,08,00,"NW_CITY_JUDGE_GUARD_01");
};
