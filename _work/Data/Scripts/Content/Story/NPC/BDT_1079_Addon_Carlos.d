instance BDT_1079_Addon_Carlos (Npc_Default)
{
	// ------ NSC ------
	name 		= "Carlos";
	guild 		= GIL_BDT;
	id 			= 1079;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FIGHTER", Face_L_Ian, BodyTex_L, ITAR_Bloodwyn_Addon);	
	Mdl_SetModelFatness	(self, 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_1079;
};
FUNC VOID Rtn_PreStart_1079()
{
	TA_Stand_Guarding (00,00,12,00,"BL_WAIT_CARLOS");
	TA_Stand_Guarding (12,00,00,00,"BL_WAIT_CARLOS");
}; 
FUNC VOID Rtn_Start_1079 ()
{
   TA_Stand_Guarding   (06,00,20,00,"ADW_PATH_TO_BL_02");
   TA_Stand_Guarding   (20,00,00,00,"BANDIT_FIGHT");
   TA_Stand_Eating     (00,00,03,00,"BANDIT_FIGHT");
   TA_Stand_Drinking   (03,00,06,00,"BANDIT_FIGHT");   	
};
