INSTANCE PIR_1362_Addon_Bones (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bones";
	guild 		= GIL_PIR;
	id 			= 1362;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1362;
};

FUNC VOID Rtn_PreStart_1362 ()
{	
	TA_Practice_Sword 	(08,00,20,00,"ADW_PIRATECAMP_TRAIN_01");
	TA_Practice_Sword	(20,00,08,00,"ADW_PIRATECAMP_TRAIN_01");
};

FUNC VOID Rtn_Start_1362 ()
{	
	TA_Practice_Sword 	(06,55,19,55,"ADW_PIRATECAMP_TRAIN_01");
	TA_Stand_Drinking	(19,55,20,55,"WP_PIR_04");
	TA_Sit_Campfire		(20,55,00,55,"WP_PIR_04");
	TA_Stand_Drinking	(00,55,01,55,"WP_PIR_04");
	TA_Sit_Campfire		(01,55,06,55,"WP_PIR_04");
};
