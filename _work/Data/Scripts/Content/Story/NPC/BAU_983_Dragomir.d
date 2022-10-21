INSTANCE BAU_983_Dragomir (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dragomir";
	guild 		= GIL_OUT;
	id 			= 983;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_SLD_Sword);
	EquipItem 	(self,itRw_Mil_Crossbow); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Lee_ähnlich, BodyTex_N, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_983;
};

FUNC VOID Rtn_Start_983 ()
{	
	TA_Sit_Bench 		(08,00,23,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01"); 
    TA_Sit_Bench			(23,00,08,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
};
