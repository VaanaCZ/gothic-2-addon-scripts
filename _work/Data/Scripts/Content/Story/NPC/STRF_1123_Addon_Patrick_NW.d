instance STRF_1123_Addon_Patrick_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Patrick"; 
	guild 		= GIL_SLD;
	id 			= 1123;
	voice 		= 7;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor]  = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword );
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_NormalBart02, BodyTex_L, ITAR_SLD_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1123;
};

FUNC VOID Rtn_Start_1123 ()
{	
	TA_Stand_Drinking (00,00,12,00,"NW_BIGFARM_PATRICK");
	TA_Stand_Drinking (12,00,00,00,"NW_BIGFARM_PATRICK");
};

