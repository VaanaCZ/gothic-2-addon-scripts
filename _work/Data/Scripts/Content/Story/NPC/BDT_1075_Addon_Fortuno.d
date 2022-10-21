instance BDT_1075_Addon_Fortuno (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fortuno";
	guild 		= GIL_BDT;
	id 			= 1075;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//Aivars
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Sword_L_03);
	
	// ------ Inventory ------
	
	CreateInvItems (self,ItMi_Joint,5);
	CreateInvItems (self,ItPl_SwampHerb,3);
	CreateInvItems (self,ItPl_Mushroom_01,5);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Fortuno, BodyTex_T, ITAR_LESTER);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_1075;
};
FUNC VOID Rtn_PreStart_1075 ()
{
    TA_Stand_ArmsCrossed (08,00,18,00,"BL_DOWN_SIDE_HERB");	
    TA_Stand_ArmsCrossed (18,00,08,00,"BL_DOWN_SIDE_HERB");	
    
};
FUNC VOID Rtn_Start_1075 ()
{
    TA_Smoke_Joint 		 (08,00,08,10,"BL_DOWN_SIDE_HERB");	
    TA_Stomp_Herb  		 (08,10,12,00,"BL_DOWN_SIDE_HERB");		
	TA_Smalltalk    	 (12,00,15,00,"BL_DOWN_RING_02");	
	TA_Sit_Bench 		 (15,00,17,00,"BL_DOWN_04_BENCH");	
	TA_Smoke_Waterpipe   (17,00,19,00,"BL_DOWN_SIDE_03");	
	TA_Smalltalk    	 (19,00,22,00,"BL_DOWN_RING_02");
	TA_Smoke_Joint       (22,00,00,00,"BL_DOWN_RING_04");
	TA_Sleep 			 (00,00,08,00,"BL_DOWN_SIDE_HERB");
};
