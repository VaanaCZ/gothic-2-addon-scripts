instance PAL_2004_Bruder  (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_PALADIN;
	guild 		= GIL_NONE;
	id 			= 2004;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
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
	B_CreateAmbientInv 	(self);
	// ------ Inventory ------
	CreateInvItems (self,ItRu_PalLight,1);
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_2004;
};

FUNC VOID Rtn_Start_2004 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_SPAWN_BRUDER");
    TA_Stand_Guarding		(23,00,08,00,"OW_SPAWN_BRUDER");
};
