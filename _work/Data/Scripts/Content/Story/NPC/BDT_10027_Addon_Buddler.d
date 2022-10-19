instance BDT_10027_Addon_Buddler (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Buddler;
	guild 		= GIL_BDT;
	id 			= 10027;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart05, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10027;
};
FUNC VOID Rtn_Start_10027()
{
	TA_Smalltalk	(06,00,12,00,"ADW_MINE_22");
	TA_Smalltalk	(12,00,06,00,"ADW_MINE_22");
};
FUNC VOID Rtn_Work_10027()
{
	TA_Pick_Ore	 (08,00,23,00,"ADW_MINE_PICK_05");
    TA_Pick_Ore	 (23,00,08,00,"ADW_MINE_PICK_05");
};
