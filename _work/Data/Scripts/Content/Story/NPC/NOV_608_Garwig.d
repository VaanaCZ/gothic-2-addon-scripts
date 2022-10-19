INSTANCE NOV_608_Garwig (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garwig";
	guild 		= GIL_NOV;
	id 			= 608;
	voice 		= 6;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	//LEVEL für Sleep- Scroll nötig M.F.
	level		= 1;
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 60;
	attribute[ATR_DEXTERITY] 		= 60;
	attribute[ATR_MANA_MAX] 		= 60;
	attribute[ATR_MANA] 			= 60;
	attribute[ATR_HITPOINTS_MAX]	= 500;
	attribute[ATR_HITPOINTS] 		= 500;			
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough02, BodyTex_L, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_608;
};

FUNC VOID Rtn_Start_608 ()
{	
	TA_Guard_Hammer	(08,00,23,00,"NW_MONASTERY_SANCTUM_02");
    TA_Guard_Hammer	(23,00,08,00,"NW_MONASTERY_SNACTUM_02");
};
