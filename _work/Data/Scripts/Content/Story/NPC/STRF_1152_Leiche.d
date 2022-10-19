instance STRF_1152_Leiche (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Straefling;
	guild 		= GIL_STRF;
	id 			= 1152;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_OCMAIN;
	
	// ------ Attribute ------
	// ------ Attribute ------
	slf.attribute[ATR_STRENGTH] 		= 10;
	slf.attribute[ATR_DEXTERITY] 		= 10;
	slf.attribute[ATR_MANA_MAX] 		= 0;
	slf.attribute[ATR_MANA] 			= 0;
	slf.attribute[ATR_HITPOINTS_MAX]	= 1;
	slf.attribute[ATR_HITPOINTS] 		= 1;																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	B_CreateAmbientInv (self);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough02, BodyTex_L, ITAR_BAU_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1152;
};

FUNC VOID Rtn_Start_1152 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_MINE3_LEICHE_02");
    TA_Stand_Guarding		(23,00,08,00,"OW_MINE3_LEICHE_02");
};
