INSTANCE KDW_1400_Addon_Saturas_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Saturas";
	guild 		= GIL_KDW; 
	id 			= 1400;
	voice 		= 14;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Saturas, BodyTex_B, ITAR_KDW_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	 
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1400;
};

FUNC VOID Rtn_Start_1400 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");

};

FUNC VOID Rtn_Ringritual_1400 ()
{	
	TA_Circle		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");  
	TA_Circle		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");

};
FUNC VOID Rtn_PreRingritual_1400 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");  
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_01");

};

FUNC VOID Rtn_OpenPortal_1400 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTAL_KDWWAIT_01");
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_01");

};

FUNC VOID Rtn_TOT_1400 ()
{	
	TA_Sleep		(08,00,20,00,"TOT");  
	TA_Sleep		(20,00,08,00,"TOT");

};
