instance BDT_1014_Bandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brago"; 
	guild 		= GIL_BDT;
	id 			= 1014;
	voice 		= 6;
	flags       = 0;									
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------							
	EquipItem			(self, ItMw_Nagelknueppel);
	

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_Bandit, 1);
	CreateInvItems (self, ItWr_SaturasFirstMessage_Addon_Sealed, 1);//ADDON
		
	// ------ visuals ------									
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Mud, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------						
	B_SetFightSkills (self, 10); 
	
	// ------ TA ------
	daily_routine 	= RTN_Start_1014;
};

FUNC VOID Rtn_Start_1014 ()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"NW_XARDAS_BANDITS_LEFT");  
	TA_Stand_ArmsCrossed (12,00,00,00,"NW_XARDAS_BANDITS_LEFT");
}; 
