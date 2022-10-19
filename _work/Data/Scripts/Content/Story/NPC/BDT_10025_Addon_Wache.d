instance BDT_10025_Addon_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= "Koch";
	guild 		= GIL_BDT;
	id 			= 10025;
	voice 		= 7;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	//EquipItem (self, ItMw_2h_Sld_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_B_Normal_Kharim, BodyTex_B, ITAR_BARKEEPER);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10025;
};
FUNC VOID Rtn_Start_10025()
{
	TA_Cook_Cauldron	(06,00,12,00,"ADW_MINE_CAULDRON");
	TA_Cook_Cauldron    (12,00,06,00,"ADW_MINE_CAULDRON");
};
