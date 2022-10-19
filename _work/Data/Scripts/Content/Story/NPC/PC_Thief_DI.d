

//#############################################
//##
//##	Dracheninsel
//##
//############################################

INSTANCE PC_Thief_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Diego";
	guild 		= GIL_NONE;
	id 			= 31;
	voice 		= 11;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_PARTYMEMBER] = TRUE;	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_SLD_Sword);  
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief",Face_L_Diego, BodyTex_L, ITAR_DIEGO);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_31;
};

FUNC VOID Rtn_Start_31()
{	
	TA_Smalltalk			(08,00,23,00,"SHIP_CREW_05");
	TA_Smalltalk			(23,00,08,00,"SHIP_CREW_05");
};

FUNC VOID Rtn_UNDEADDRAGONDEAD_31()
{	
	TA_Stand_WP 			(08,00,23,00,"WP_UNDEAD_RIGHT_DOWN_01");
	TA_Stand_WP 			(23,00,08,00,"WP_UNDEAD_RIGHT_DOWN_01");
};

FUNC VOID Rtn_SittingShipDI_31()
{	
	TA_Sit_Bench 	(08,00,23,00,"SHIP_CREW_04");
	TA_Sit_Bench 	(23,00,08,00,"SHIP_CREW_04");
};

