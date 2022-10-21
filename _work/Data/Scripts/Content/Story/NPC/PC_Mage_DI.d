

//#############################################
//##
//##	Dracheninsel
//##
//#############################################

INSTANCE PC_Mage_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Milten";
	guild 		= GIL_KDF;
	id 			= 22;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_PARTYMEMBER] = TRUE;	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Milten, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_22;
};

FUNC VOID Rtn_Start_22 ()
{	
	TA_Smalltalk			(08,00,23,00,"SHIP_CREW_19");
	TA_Smalltalk			(23,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_UNDEADDRAGONDEAD_22 ()
{	
	TA_Stand_WP			(08,00,23,00,"SKELETTE");
	TA_Stand_WP			(23,00,08,00,"SKELETTE");
};

FUNC VOID Rtn_SittingShipDI_22 ()
{	
	TA_Sit_Bench			(08,00,23,00,"SHIP_CREW_19");
	TA_Sit_Bench			(23,00,08,00,"SHIP_CREW_19");
};
