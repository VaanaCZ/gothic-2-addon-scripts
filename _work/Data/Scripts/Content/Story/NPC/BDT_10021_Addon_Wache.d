instance BDT_10021_Addon_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Guard;
	guild 		= GIL_BDT;
	id 			= 10021;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_BL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Zweihaender4);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_P_Normal02, BodyTex_P, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10021;
};
FUNC VOID Rtn_Start_10021()
{
	TA_Stand_Guarding (00,00,12,00,"BL_RAVEN_GUARD_04");
	TA_Stand_Guarding (12,00,00,00,"BL_RAVEN_GUARD_04");
};
