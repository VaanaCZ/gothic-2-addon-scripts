INSTANCE PIR_1357_Addon_Garett (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garett";
	guild 		= GIL_PIR;
	id 			= 1357;
	voice 		= 9;
	flags       = FALSE;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
	
	// ------ Inventory ------
	// Händler
	CreateInvItems (self, ItBE_Addon_Prot_EdgPoi, 1); 
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_NormalBart05, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1357;
};

FUNC VOID Rtn_Start_1357 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_HUT1_01");
	TA_Stand_Drinking 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_10");
};

