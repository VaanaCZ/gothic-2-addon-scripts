INSTANCE BAU_982_Grimbald (Npc_Default)
{
	// ------ NSC ------
	name 		= "Grimbald";
	guild 		= GIL_OUT;
	id 			= 982;
	voice 		= 7;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_SLD_Sword); 
	EquipItem	(self, ItRw_Sld_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Normal_Kirgo, BodyTex_B, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_982;
};

FUNC VOID Rtn_Start_982 ()
{	
	TA_Stand_Guarding 	(08,00,23,00,"NW_TROLLAREA_PATH_79"); 
    TA_Stand_Guarding	(23,00,08,00,"NW_TROLLAREA_PATH_79");
};
FUNC VOID Rtn_Jagd_982 ()
{	
	TA_RunToWP 	(08,00,23,00,"NW_TROLLAREA_PATH_80"); 
    TA_RunToWP	(23,00,08,00,"NW_TROLLAREA_PATH_80");
};
FUNC VOID Rtn_JagdOver_982 ()
{	
	TA_Stand_Guarding 	(08,00,23,00,"NW_TROLLAREA_PATH_79"); 
    TA_Stand_Guarding	(23,00,08,00,"NW_TROLLAREA_PATH_79");
};

