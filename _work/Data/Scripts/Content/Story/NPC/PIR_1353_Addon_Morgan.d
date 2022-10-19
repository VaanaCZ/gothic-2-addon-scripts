INSTANCE PIR_1353_Addon_Morgan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgan";
	guild 		= GIL_PIR;
	id 			= 1353;
	voice 		= 7;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Doppelaxt);
	
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Tough_Santino, BodyTex_L, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_START_1353;
};

FUNC VOID Rtn_START_1353 ()
{
	TA_Sleep	(05,00,20,00,"ADW_PIRATECAMP_CAVE_BED");
	TA_Sleep	(20,00,05,00,"ADW_PIRATECAMP_CAVE_BED");
};

FUNC VOID Rtn_GregIsBack_1353 ()
{
	TA_Saw 		(23,00,09,00,"ADW_PIRATECAMP_SAW_01");
	TA_Saw		(09,00,23,00,"ADW_PIRATECAMP_SAW_01");
};
