instance BDT_1082_Addon_Skinner (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skinner";
	guild 		= GIL_BDT;
	id 			= 1082;
	voice 		= 8;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	
	//Aivars
	aivar[AIV_StoryBandit] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_Betty);

	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, ITKE_ADDON_SKINNER,1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_BDT_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1082;
};
FUNC VOID Rtn_Start_1082 ()
{
    TA_Sleep (09,00,21,00,"BL_DOWN_HUT_02_SLEEP");
    TA_Sleep  (21,00,09,00,"BL_DOWN_HUT_02_SLEEP");		
};
