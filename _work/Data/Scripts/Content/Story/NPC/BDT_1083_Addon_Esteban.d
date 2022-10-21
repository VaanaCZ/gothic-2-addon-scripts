instance BDT_1083_Addon_Esteban (Npc_Default)
{
	// ------ NSC ------
	name 		= "Esteban";
	guild 		= GIL_BDT;
	id 			= 1083;
	voice 		= 7;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//------- AIVAR -------
	
	AIVAR[AIV_StoryBandit_Esteban] 	= TRUE;
	AIVAR[AIV_StoryBandit] 			= TRUE;
	aivar[AIV_NewsOverride]	  		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Axe);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, ITMI_Addon_Stone_01,5);//MISSIONITEMS!
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_ToughBart_Quentin, BodyTex_L, ITAR_BDT_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1083;
};
FUNC VOID Rtn_Start_1083 ()
{	
   TA_Stand_ArmsCrossed  (09,00,10,00,"BL_MID_07");
   TA_Stand_ArmsCrossed  (10,00,09,00,"BL_MID_07");
};

