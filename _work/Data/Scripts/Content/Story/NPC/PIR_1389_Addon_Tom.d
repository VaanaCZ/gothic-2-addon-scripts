instance PIR_1389_Addon_Tom (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tom";
	guild 		= GIL_PIR;
	id 			= 1389;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ElBastardo);
	
	// ------ Inventory ------

	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FIGHTER", Face_N_Normal19, BodyTex_N, ITAR_PIR_L_Addon);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1389;
};

FUNC VOID Rtn_Start_1389 ()
{
    TA_Stand_WP   (09,00,21,00,"ADW_PIRATECAMP_BEACH_15");
    TA_Stand_WP   (21,00,09,00,"ADW_PIRATECAMP_BEACH_15");		
};
