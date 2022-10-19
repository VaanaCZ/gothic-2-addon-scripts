
instance Pal_201_Ingmar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ingmar";
	guild 		= GIL_PAL;
	id 			= 201;
	voice 		= 06;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_ToughBart01, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_201;
};

FUNC VOID Rtn_Start_201 ()
{	
	TA_Stand_WP	(08,00,23,00,"NW_CITY_CITYHALL_WARROOM_02");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_CITYHALL_WARROOM_02");
};
