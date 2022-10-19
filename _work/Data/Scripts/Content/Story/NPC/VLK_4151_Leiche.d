instance VLK_4151_Leiche (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_WAFFENKNECHT; 
	guild 		= GIL_MIL;
	id 			= 4151;
	voice 		= 1;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	
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

	
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4151;
};

FUNC VOID Rtn_Start_4151 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"OW_SPAWN_TRACK_LEICHE_00");
    TA_Stand_Guarding		(22,00,08,00,"OW_SPAWN_TRACK_LEICHE_00");
};
