INSTANCE NOV_653_ToterNovize (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_ToterNovize;
	guild 		= GIL_NOV;
	id 			= 653;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	//EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_653;
};

FUNC VOID Rtn_Start_653 ()
{	
	TA_Sleep		(08,00,22,00,"NW_TROLLAREA_RITUALPATH_04");
    TA_Sleep		(22,00,08,00,"NW_TROLLAREA_RITUALPATH_04");
};
