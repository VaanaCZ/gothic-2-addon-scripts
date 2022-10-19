instance BDT_10102_Addon_TowerBandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;
	guild 		= GIL_BDT;
	id 			= 10102;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,1);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Mil_Crossbow);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_L_Normal_GorNaBar, BodyTex_L, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0.7);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10102;
};
FUNC VOID Rtn_Start_10102 ()
{
     TA_Stand_Drinking  (09,00,21,00,"ADW_PIRATECAMP_2_TOWER_05");
     TA_Stand_Drinking   (21,00,09,00,"ADW_PIRATECAMP_2_TOWER_05");		
};
