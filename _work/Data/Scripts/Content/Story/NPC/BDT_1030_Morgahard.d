
instance BDT_1030_Morgahard (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgahard"; 
	guild 		= GIL_OUT;
	id 			= 1030;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	//aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG ;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_SLD_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItWr_RichterKomproBrief_MIS, 1);									
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bartholo, BodyTex_N, ITAR_BDT_H );	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1030;
};

FUNC VOID Rtn_Start_1030 ()
{	
	TA_Smalltalk	(08,00,23,00,"NW_BIGFARM_HOUSE_OUT_05"); 
    TA_Smalltalk	(23,00,08,00,"NW_BIGFARM_HOUSE_OUT_05");
};
