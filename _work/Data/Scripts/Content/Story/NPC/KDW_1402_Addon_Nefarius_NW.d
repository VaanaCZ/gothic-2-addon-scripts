INSTANCE KDW_1402_Addon_Nefarius_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nefarius";
	guild 		= GIL_KDW; 
	id 			= 1402;
	voice 		= 5;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_NormalBart_Nefarius, BodyTex_P, ITAR_KDW_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1402;
};

FUNC VOID Rtn_Start_1402 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTAL_09"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTAL_09");
};

FUNC VOID Rtn_Ringritual_1402 ()
{	
	TA_Circle		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");  
	TA_Circle		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");

};
FUNC VOID Rtn_PreRingritual_1402 ()
{	
	TA_Stand_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_42");  
	TA_Stand_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_42");

};

FUNC VOID Rtn_OpenPortal_1402 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTAL_KDWWAIT_03");
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_03");

};
FUNC VOID Rtn_TOT_1402 ()
{	
	TA_Sleep		(08,00,20,00,"TOT");  
	TA_Sleep		(20,00,08,00,"TOT");

};
