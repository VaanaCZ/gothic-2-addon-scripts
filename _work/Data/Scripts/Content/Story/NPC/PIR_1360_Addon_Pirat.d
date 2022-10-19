INSTANCE PIR_1360_Addon_PIRAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_PIRAT;
	guild 		= GIL_PIR;
	id 			= 1360;
	voice 		= 7;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Ratford, BodyTex_L, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1360;
};

FUNC VOID Rtn_PreStart_1360 ()
{	
	TA_Repair_Hut 	(08,00,20,00,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Repair_Hut	(20,00,08,00,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
};

FUNC VOID Rtn_Start_1360 ()
{	
	TA_Repair_Hut 	 	(06,10,19,10,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Sit_Campfire	 	(19,10,20,10,"WP_PIR_06");
	TA_Stand_Drinking 	(20,10,21,10,"WP_PIR_06");
	TA_Sit_Campfire 	(21,10,03,10,"WP_PIR_06");
	TA_Pee 				(03,10,03,15,"WP_PIR_06");
	TA_Sit_Campfire 	(03,15,06,10,"WP_PIR_06");
};

FUNC VOID Rtn_Follow_1360 ()
{	
	TA_Follow_Player (08,00,20,00,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Follow_Player (20,00,08,00,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
};
