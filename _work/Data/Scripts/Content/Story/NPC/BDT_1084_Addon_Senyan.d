instance BDT_1084_Addon_Senyan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Senyan";
	guild 		= GIL_BDT;
	id 			= 1084;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//aivars 
	aivar[AIV_NewsOverride]	   = TRUE;
	aivar[AIV_StoryBandit]	   = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Tough_Pacho, BodyTex_B, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1084;
};
FUNC VOID Rtn_Start_1084 ()
{
   TA_Stand_Guarding    (10,00,12,00,"BL_DOWN_CENTER_03");
   TA_Stand_Guarding    (12,00,10,00,"BL_DOWN_CENTER_03");
};


