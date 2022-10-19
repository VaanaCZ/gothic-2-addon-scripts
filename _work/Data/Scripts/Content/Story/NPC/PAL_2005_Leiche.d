instance PAL_2005_Leiche  (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_PALADIN;
	guild 		= GIL_NONE;
	id 			= 2005;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	// ------ Attribute ------
	slf.attribute[ATR_STRENGTH] 		= 10;
	slf.attribute[ATR_DEXTERITY] 		= 10;
	slf.attribute[ATR_MANA_MAX] 		= 0;
	slf.attribute[ATR_MANA] 			= 0;
	slf.attribute[ATR_HITPOINTS_MAX]	= 1;
	slf.attribute[ATR_HITPOINTS] 		= 1;											
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self);	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart01, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_2005;
};

FUNC VOID Rtn_Start_2005 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_MINE3_LEICHE_05");
    TA_Stand_Guarding		(23,00,08,00,"OW_MINE3_LEICHE_05");
};
