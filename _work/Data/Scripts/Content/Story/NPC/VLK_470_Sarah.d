
instance VLK_470_Sarah (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sara";	
	guild 		= GIL_VLK;
	id 			= 470;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Vlk_Sword);
		
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_Blondie, BodyTexBabe_N, ITAR_VlkBabe_L);	

	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_470;
};

FUNC VOID Rtn_Start_470 ()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"NW_CITY_SARAH"); 
    TA_Sleep				(20,15,05,15,"NW_CITY_HOTEL_BED_08");
};

FUNC VOID Rtn_Knast_470 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_HABOUR_KASERN_RENGARU"); 
    TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU");
};
FUNC VOID Rtn_Tot_470 ()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"TOT"); 
    TA_Sleep				(20,15,05,15,"TOT");
};
