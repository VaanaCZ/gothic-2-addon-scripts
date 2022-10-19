instance BDT_1073_Addon_Sancho (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sancho";
	guild 		= GIL_BDT;
	id 			= 1073;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Mordrag, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1073;
};
FUNC VOID Rtn_Start_1073 ()
{
     TA_Stand_Drinking   (09,00,21,00,"ADW_BANDIT_VP1_01"); 
     TA_Stand_Drinking   (21,00,09,00,"ADW_BANDIT_VP1_01");				
};
