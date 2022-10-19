instance VLK_469_Halvor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Halvor"; 
	guild 		= GIL_VLK;
	id 			= 469;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_Mace_L_03); 
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart11, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_469;
};
FUNC VOID Rtn_Start_469()
{	
	
	TA_Stand_ArmsCrossed		(05,00,20,00,"NW_CITY_HABOUR_POOR_AREA_PATH_01"); 
    TA_Stand_Drinking			(20,00,01,00,"NW_CITY_HABOUR_PUFF_IN_07");
    TA_Sleep					(01,00,05,00,"NW_CITY_BED_HALVOR");
};

FUNC VOID Rtn_Prison_469 ()
{	
	TA_Sit_Campfire		(08,00,22,00,"NW_CITY_HABOUR_KASERN_HALVOR"); 
    TA_Sit_Campfire		(22,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};
