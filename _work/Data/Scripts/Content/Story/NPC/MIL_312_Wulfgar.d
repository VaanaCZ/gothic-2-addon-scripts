
instance Mil_312_Wulfgar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wulfgar";	
	guild 		= GIL_MIL;
	id 			= 312;
	voice 		= 4;
	flags       = 0;																
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart06, BodyTex_N, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_312;
};
FUNC VOID Rtn_PreStart_312 ()
{	
	TA_Stand_ArmsCrossed		(06,55,21,00,"NW_CITY_HABOUR_KASERN_CENTRE_01");
    TA_Sit_Throne 				(21,00,05,00,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Practice_Sword 			(05,00,06,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};
FUNC VOID Rtn_Start_312 ()
{	
	TA_Stand_ArmsCrossed		(06,55,21,00,"NW_CITY_HABOUR_KASERN_CENTRE_01");
    TA_Sit_Throne 				(21,00,00,07,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Smalltalk				(00,07,05,00,"NW_CITY_HABOUR_KASERN_OFFICE");
    TA_Practice_Sword 			(05,00,06,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};
