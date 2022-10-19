instance PAL_2002_Leiche  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Silvestro";
	guild 		= GIL_NONE;
	id 			= 2002;
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
	
	// ------ Inventory ------
	CreateInvItems (self,ItWr_Silvestro_MIS,1);
	CreateInvItems (self, ItPO_Mana_02,2);
	CreateInvItems (self,ItmI_Gold,100);
	CreateInvItems (self,ItPo_Health_02,2);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_2002;
};

FUNC VOID Rtn_Start_2002 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_MINE3_LEICHE_01");
    TA_Stand_Guarding		(23,00,08,00,"OW_MINE3_LEICHE_01");
};
