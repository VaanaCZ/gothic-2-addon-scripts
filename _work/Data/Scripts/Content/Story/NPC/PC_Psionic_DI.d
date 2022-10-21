
//#############################################
//##
//##	Dracheninsel
//##
//############################################

INSTANCE PC_Psionic_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lester";
	guild 		= GIL_NONE;
	id 			= 24;
	voice 		= 13;
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
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self,ItMw_Kriegshammer2);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_24;
};

FUNC VOID Rtn_Start_24()
{	
	TA_Smalltalk			(08,00,23,00,"SHIP_CREW_19");
	TA_Smalltalk			(23,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_UNDEADDRAGONDEAD_24()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"DI_DRACONIANAREA_19");
	TA_Stand_ArmsCrossed	(23,00,08,00,"DI_DRACONIANAREA_19");
};

FUNC VOID Rtn_SittingShipDI_24 ()
{	
	TA_Sit_Bench			(08,00,23,00,"SHIP_CREW_19");
	TA_Sit_Bench			(23,00,08,00,"SHIP_CREW_19");
};
