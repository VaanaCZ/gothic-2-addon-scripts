INSTANCE PIR_1356_Addon_Bill (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bill";
	guild 		= GIL_PIR;
	id 			= 1356;
	voice 		= 3;
	flags       = FALSE;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Drax, BodyTex_N, ITAR_PIR_L_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1356;
};

FUNC VOID Rtn_PreStart_1356 ()
{	
	TA_Saw			(08,00,20,00,"ADW_PIRATECAMP_SAW_01");
	TA_Saw			(20,00,08,00,"ADW_PIRATECAMP_SAW_01");
};

FUNC VOID Rtn_Start_1356 ()
{	
	TA_Saw			(08,00,20,00,"ADW_PIRATECAMP_SAW_01");
	TA_Stand_Eating	(20,00,21,00,"WP_PIR_01");
	TA_Sit_Campfire	(21,00,08,00,"WP_PIR_01");
};

FUNC VOID Rtn_GregIsBack_1356 ()
{	
	TA_Sit_Campfire	(08,00,20,00,"WP_PIR_01");
	TA_Stand_Eating	(20,00,21,00,"WP_PIR_01");
	TA_Sit_Campfire	(21,00,08,00,"WP_PIR_01");
};

