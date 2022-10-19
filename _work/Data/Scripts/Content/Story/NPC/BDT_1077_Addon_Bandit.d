instance BDT_1077_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 1077;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_TAL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Bau_Axe);

	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_Normal01, BodyTex_P, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, - 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1077;
};
FUNC VOID Rtn_Start_1077 ()
{
 	TA_Smalltalk 	 	(06,00,12,00,"BL_SMALLTALK_01");
	TA_Smith_Sharp 	 	(12,00,22,04,"ADW_PATH_TO_BL_SHARP");
	TA_Roast_Scavenger  (22,04,06,00,"ADW_SWAMP_ROAST");
};
