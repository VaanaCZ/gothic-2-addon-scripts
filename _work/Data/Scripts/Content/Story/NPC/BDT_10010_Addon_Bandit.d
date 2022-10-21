instance BDT_10010_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 10010;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_BL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Nagelknueppel);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_NormalBart_Rufus, BodyTex_L, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10010;
};
FUNC VOID Rtn_Start_10010 ()
{
	TA_Sit_Bench        (10,00,12,00,"BL_MID_09");
	TA_Sit_Bench        (12,00,10,00,"BL_MID_09");
};
