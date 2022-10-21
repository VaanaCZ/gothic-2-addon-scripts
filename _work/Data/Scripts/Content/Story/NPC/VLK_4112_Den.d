
instance VLK_4112_Den (Npc_Default)
{
	// ------ NSC ------
	name 		= "Den"; 
	guild 		= GIL_MIL;
	id 			= 4112;
	voice 		= 5;
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
	EquipItem (self, ItMw_1H_Vlk_Dagger);
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 200);
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItMi_GoldRing,   1);
	CreateInvItems (self, ItMi_SilverCandleHolder, 1);
	CreateInvItems (self, ItMi_GoldNecklace,   1);	
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Grim, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4112;
};

FUNC VOID Rtn_Start_4112 ()
{	
	TA_Stand_Guarding 	(08,00,23,00,"OW_PATH_182");
    TA_Stand_Guarding 	(23,00,08,00,"OW_PATH_182");
};
