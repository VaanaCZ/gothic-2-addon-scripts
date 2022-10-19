instance BDT_10001_Addon_Bandit_L (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT;//Wache
	guild 		= GIL_BDT;
	id 			= 10001;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_BL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Mil_Crossbow);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Important_Arto, BodyTex_N, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10001;
};
FUNC VOID Rtn_Start_10001 ()
{
   TA_Smalltalk      (10,00,12,00,"BL_UP_RING_02");
   TA_Smalltalk      (12,00,10,00,"BL_UP_RING_02");		
};			
		
		
		
		
		
		
		
