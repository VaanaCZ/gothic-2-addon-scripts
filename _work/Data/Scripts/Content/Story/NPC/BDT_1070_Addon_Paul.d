instance BDT_1070_Addon_Paul (Npc_Default)
{
	// ------ NSC ------
	name 		= "Paul";
	guild 		= GIL_BDT;
	id 			= 1070;
	voice 		= 3;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self,ItMi_Nugget, 1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Drax, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_1070;
};
FUNC VOID Rtn_PreStart_1070()
{
	TA_Saw 			 (06,00,13,00,"BL_SMITH_YARD_SAW");
	TA_Saw 			 (13,00,06,00,"BL_SMITH_YARD_SAW");
};
FUNC VOID Rtn_Away_1070()
{
	TA_Stand_Drinking      (10,00,20,00,"BL_SMITH_STAIRS");
	TA_Stand_Drinking      (20,00,10,00,"BL_SMITH_STAIRS");	
};
FUNC VOID Rtn_Start_1070 ()
{
   TA_Saw 			 (06,00,13,00,"BL_SMITH_YARD_SAW");
   TA_Smith_Anvil    (13,00,17,00,"BL_UP_02");
   TA_Saw 			 (17,00,19,00,"BL_SMITH_YARD_SAW");
   TA_Smith_Sharp    (19,00,23,00,"BL_SMITH_YARD_02");
   TA_Stand_Drinking (23,00,06,00,"BL_UP_10");	
};
FUNC VOID Rtn_Mine_1070 ()
{
   TA_Pick_Ore      (10,00,20,00,"ADW_MINE_PICK_07");
   TA_Pick_Ore      (20,00,10,00,"ADW_MINE_PICK_07");	
};
