instance BDT_1078_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 1078;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_TAL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Mace_L_01);
	EquipItem (self, ItRw_Bow_M_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Richter, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, -0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1078;
};
FUNC VOID Rtn_Start_1078 ()
{
	TA_Sit_Campfire 	(20,00,12,05,"ADW_BANDIT_VP1_08_B");
	TA_Stand_Guarding   (12,05,20,00,"ADW_BANDIT_VP1_07_B");
};
