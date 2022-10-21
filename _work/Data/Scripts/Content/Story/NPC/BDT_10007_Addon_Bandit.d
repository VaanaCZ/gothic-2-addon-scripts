instance BDT_10007_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 10007;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_BL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Normal01, BodyTex_P, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10007;
};
FUNC VOID Rtn_Start_10007 ()
{
	TA_Stand_Drinking   (09,00,21,00,"BL_ENTRANCE_SIDE_03");
    TA_Stand_Drinking   (21,00,09,00,"BL_ENTRANCE_SIDE_03");		
	
};
