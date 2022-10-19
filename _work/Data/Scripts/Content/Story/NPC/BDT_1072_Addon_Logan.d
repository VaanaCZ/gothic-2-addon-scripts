instance BDT_1072_Addon_Logan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Logan";
	guild 		= GIL_BDT;
	id 			= 1072;
	voice 		= 10;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//aivars
	aivar[AIV_NewsOverride] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Bow_M_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Cipher_neu, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, - 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1072;
};
FUNC VOID Rtn_Start_1072 ()
{
     TA_Stand_Guarding   (09,00,21,00,"ADW_BANDIT_VP3_03"); 
     TA_Stand_Guarding   (21,00,09,00,"ADW_BANDIT_VP3_03");			
};
FUNC VOID Rtn_Jagd_1072 ()
{
     TA_Stand_Guarding   (09,00,21,00,"ADW_BANDIT_VP3_05"); 
     TA_Stand_Guarding   (21,00,09,00,"ADW_BANDIT_VP3_05");			
};
FUNC VOID Rtn_Lager_1072 ()
{
     TA_Stand_Drinking   (09,00,21,00,"BL_INN_03_C"); 
     TA_Stand_Drinking   (21,00,09,00,"BL_INN_03_C");			
};
FUNC VOID Rtn_Mine_1072()
{
	TA_Pick_Ore      (10,00,20,00,"ADW_MINE_PICK_08");
	TA_Pick_Ore      (20,00,10,00,"ADW_MINE_PICK_08");	
};
