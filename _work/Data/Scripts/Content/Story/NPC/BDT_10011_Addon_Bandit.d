instance BDT_10011_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 10011;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_TAL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_L_NormalBart_Rufus, BodyTex_L, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10011;
};
FUNC VOID Rtn_Start_10011 ()
{
	TA_Sit_Bench  	   (22,02,06,00,"ADW_SWAMP_SIT_BENCH_02");
	TA_Smalltalk  	   (06,00,22,02,"BL_FIGHT_03");	
};
