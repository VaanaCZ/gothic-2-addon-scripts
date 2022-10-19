
instance Mil_337_Mika (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mika";	
	guild 		= GIL_OUT;	//Joly: Wenn GIL_OUT Probleme macht, bitte mir Bescheid geben!!!  Björn
	id 			= 337;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	CreateInvItems (self, ItPo_Health_01, 4);	//Joly: damit er frisch bei Farm2 ankommt.								
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_L_ToughBart_Quentin, BodyTex_L, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_337;
};

FUNC VOID Rtn_Start_337 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"NW_CITY_TO_FOREST_01");
    TA_Stand_Guarding	(22,00,08,00,"NW_CITY_TO_FOREST_01");
};

FUNC VOID Rtn_Akil_337 ()
{	
	TA_RunToWP 	(06,00,18,00,"NW_FARM2_PATH_03");
	TA_RunToWP	(18,00,06,00,"NW_FARM2_PATH_03");
};
