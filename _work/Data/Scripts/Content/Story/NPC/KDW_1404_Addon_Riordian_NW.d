INSTANCE KDW_1404_Addon_Riordian_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Riordian";
	guild 		= GIL_KDW; 
	id 			= 1404;
	voice 		= 10;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_KDW_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1404;
};

FUNC VOID Rtn_Start_1404 ()
{	
	TA_Stand_Guarding 	(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_34"); 
	TA_Stand_Guarding	(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_34");

};

FUNC VOID Rtn_Saturas_1404 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");

};

FUNC VOID Rtn_Ringritual_1404 ()
{	
	TA_Circle		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05"); 
	TA_Circle		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");

};

FUNC VOID Rtn_PreRingritual_1404 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_05");

};

FUNC VOID Rtn_OpenPortal_1404 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTAL_KDWWAIT_05"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_05");

};
FUNC VOID Rtn_TOT_1404 ()
{	
	TA_Sleep		(08,00,20,00,"TOT");  
	TA_Sleep		(20,00,08,00,"TOT");

};
