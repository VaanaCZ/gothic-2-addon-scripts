instance BDT_10014_Addon_Thorus (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thorus";
	guild 		= GIL_BDT;
	id 			= 10014;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	//aivars

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self,ITKE_Addon_Thorus,1); 	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Thorus, BodyTex_B, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PReStart_10014;
};
FUNC VOID Rtn_Prestart_10014()
{
	TA_Stand_Guarding (00,00,12,00,"BL_STAIRS_03");
	TA_Stand_Guarding (12,00,00,00,"BL_STAIRS_03");
};
FUNC VOID Rtn_Start_10014 ()
{
	TA_Read_Bookstand (00,00,12,00,"BL_BLOODWYN_BOOK");
	TA_Stand_Guarding (12,00,20,00,"BL_BLOODWYN_04");
	TA_Stand_Guarding (20,00,00,00,"BL_STAIRS_03");
};
FUNC VOID Rtn_TALK_10014()
{
	TA_Stand_WP (00,00,12,00,"BL_UP_PLACE_03");
	TA_Stand_WP (12,00,00,00,"BL_UP_PLACE_03");
};

