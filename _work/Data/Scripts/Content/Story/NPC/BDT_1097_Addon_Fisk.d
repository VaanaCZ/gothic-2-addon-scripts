instance BDT_1097_Addon_Fisk (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fisk";
	guild 		= GIL_BDT;
	id 			= 1097;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Cavalorn, BodyTex_B, ITAR_DIEGO);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_1097;
};
FUNC VOID Rtn_PreStart_1097 ()
{
  	TA_Stand_WP   (08,00,20,00,"BL_MID_05");
  	TA_Stand_WP   (20,00,08,00,"BL_MID_05");
};
FUNC VOID Rtn_Start_1097 ()
{
  	TA_Stand_Guarding   (08,00,20,00,"BL_MERCHANT_01");
  	TA_Stand_Guarding   (20,00,08,00,"BL_MERCHANT_01");
};
FUNC VOID Rtn_Meeting_1097 ()
{
  	TA_Stand_Guarding   (08,00,20,00,"BL_INN_UP_06");
  	TA_Stand_Guarding   (20,00,08,00,"BL_INN_UP_06");
};
FUNC VOID Rtn_Ambush_1097 ()
{
  	TA_Stand_WP  (08,00,20,00,"BL_INN_07");
  	TA_Stand_WP   (20,00,08,00,"BL_INN_07");
};


