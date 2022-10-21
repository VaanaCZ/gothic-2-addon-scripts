instance BDT_1086_Addon_Scatty (Npc_Default)
{
	// ------ NSC ------
	name 		= "Scatty";
	guild 		= GIL_BDT;
	id 			= 1086;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Schwert5);
	
	// ------ Inventory ------
	
	CreateInvItems (self,ItMi_GoldNugget_Addon,5);
	CreateInvItems (self,ItPo_Health_03,2);
	
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Scatty, BodyTex_L, ITAR_DIEGO);	
	Mdl_SetModelFatness	(self, 1.6);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1086;
};
FUNC VOID Rtn_Start_1086 ()
{
	TA_Stand_Guarding 	  (19,00,20,00,"BL_MINELAGER_06");	
	TA_Stand_Guarding 	  (20,00,09,00,"BL_MINELAGER_06");	

}; 
