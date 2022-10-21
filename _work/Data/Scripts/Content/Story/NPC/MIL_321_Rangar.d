
instance Mil_321_Rangar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rangar";	
	guild 		= GIL_MIL;
	id 			= 321;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	CreateInvItems (self,ItKe_City_Tower_02,1);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Skip, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_321;
};

FUNC VOID Rtn_Start_321()
{	
	TA_Stand_Drinking	(08,00,20,00,"NW_CITY_BEER_06");
    TA_Stand_Drinking	(20,00,08,00,"NW_CITY_BEER_06");
};

FUNC VOID Rtn_PrePalCampKlau_321()
{	
	TA_Sit_Bench  (03,00,24,00,"NW_CITY_WAY_TO_SHIP_03");
    TA_Sit_Bench  (24,00,03,00,"NW_CITY_WAY_TO_SHIP_03");	
};

FUNC VOID Rtn_PalCampKlau_321()
{	
	TA_Stand_Drinking	(04,00,23,00,"NW_CITY_BEER_06");
    TA_Pick_FP  		(23,00,04,00,"NW_CITY_PALCAMP_15");		//Joly:Klauen am Palcamp (Martins Auftrag)
};
