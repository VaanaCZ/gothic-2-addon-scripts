instance BDT_1074_Addon_Edgor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Edgor";
	guild 		= GIL_BDT;
	id 			= 1074;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Sld_Bow);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart20, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1074;
};
FUNC VOID Rtn_Start_1074 () //RUINE
{
     TA_Sit_Campfire 		(09,00,12,00,"ADW_BANDIT_VP1_09"); 
     TA_Sit_Campfire	    (12,00,09,00,"ADW_BANDIT_VP1_09");			
};
