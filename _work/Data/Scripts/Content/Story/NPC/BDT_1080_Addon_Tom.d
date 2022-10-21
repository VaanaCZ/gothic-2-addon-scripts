instance BDT_1080_Addon_Tom (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tom";
	guild 		= GIL_BDT;
	id 			= 1080;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ElBastardo);
	
	// ------ Inventory ------
	
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1080;
};

FUNC VOID Rtn_Start_1080 ()
{
    TA_Sit_Campfire   (09,00,21,00,"ADW_BL_HOEHLE_04");
    TA_Sit_Campfire   (21,00,09,00,"ADW_BL_HOEHLE_04");		
};
FUNC VOID Rtn_LAGER_1080 ()
{
    TA_Stand_Drinking   (09,00,21,00,"BL_INN_03_C");
    TA_Stand_Drinking   (21,00,09,00,"BL_INN_03_C");		
};
