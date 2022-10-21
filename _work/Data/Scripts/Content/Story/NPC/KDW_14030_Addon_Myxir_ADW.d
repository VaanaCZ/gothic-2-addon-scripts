INSTANCE KDW_14030_Addon_Myxir_ADW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Myxir";
	guild 		= GIL_KDW; 
	id 			= 14030;
	voice 		= 12;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_NormalBart_Cronos, BodyTex_P, ITAR_KDW_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_14030;
};

FUNC VOID Rtn_Start_14030 ()
{	
	TA_Study_WP	(06,50,07,15,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP	(07,15,08,40,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP	(08,40,09,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP	(09,50,10,45,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP	(10,45,11,55,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP	(11,55,12,50,"ADW_ENTRANCE_PLATEAU_03");

	TA_Study_WP	(12,50,13,15,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP	(13,15,14,40,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP	(14,40,15,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP	(15,50,16,45,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP	(16,45,17,55,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP	(17,55,18,50,"ADW_ENTRANCE_PLATEAU_03");

	TA_Study_WP	(18,50,19,15,"ADW_ENTRANCE_PLATEAU_12C");
	TA_Study_WP	(19,15,20,40,"ADW_ENTRANCE_PLATEAU_07A");
	TA_Study_WP	(20,40,21,50,"ADW_ENTRANCE_PLATEAU_03");
	TA_Study_WP	(21,50,22,00,"ADW_ENTRANCE_PLATEAU_12C");

	TA_Smalltalk 	(22,00,06,50,"ADW_ENTRANCE_BUILDING2_03");
};
FUNC VOID Rtn_TOT_14030 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"TOT");
    TA_Stand_ArmsCrossed		(23,00,08,00,"TOT");		
};
