instance BDT_10008_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 10008;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2H_OrcAxe_01);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Tough_Silas, BodyTex_B, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10008;
};
FUNC VOID Rtn_Start_10008 ()
{
    TA_Cook_Cauldron	   (08,00,12,00,"BL_DOWN_CENTER_07");
    TA_Pee 				   (12,00,12,05,"BL_DOWN_CENTER_07_C");
	TA_Cook_Cauldron	   (12,05,16,00,"BL_DOWN_CENTER_07");
    TA_Pee 				   (16,00,16,05,"BL_DOWN_CENTER_07_C");
    TA_Cook_Cauldron	   (16,05,00,00,"BL_DOWN_CENTER_07");
    TA_Pee 				   (00,00,00,05,"BL_DOWN_CENTER_07_C");
	TA_Sit_Bench 		   (00,05,08,00,"BL_DOWN_RING_05");
	
};
