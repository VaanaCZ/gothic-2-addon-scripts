INSTANCE PIR_1371_Addon_Hank (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hank";
	guild 		= GIL_PIR;
	id 			= 1371;
	voice 		= 6;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hSword);
		
	// ------ Inventory ------
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1370;
};

FUNC VOID Rtn_Start_1371 ()
{	
	TA_Smalltalk 	(05,00,20,00,"ADW_PIRATECAMP_WATERHOLE_CAVE");
	TA_Smalltalk	(20,00,05,00,"ADW_PIRATECAMP_WATERHOLE_CAVE");
};
