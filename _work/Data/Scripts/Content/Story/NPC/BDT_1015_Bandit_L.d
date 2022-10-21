instance BDT_1015_Bandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT; 
	guild 		= GIL_BDT;
	id 			= 1015;
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
	EquipItem			(self, ItMw_1h_Vlk_Dagger);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItWr_BanditLetter_MIS,1);
		
	// ------ visuals ------									
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal01, BodyTex_B, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------						
	B_SetFightSkills (self, 10); 
	
	// ------ TA ------
	daily_routine 	= RTN_Start_1015;
};

FUNC VOID Rtn_Start_1015 ()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"NW_XARDAS_BANDITS_RIGHT");  
	TA_Stand_ArmsCrossed (12,00,00,00,"NW_XARDAS_BANDITS_RIGHT");
}; 

