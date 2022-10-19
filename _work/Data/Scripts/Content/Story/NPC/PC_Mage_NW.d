
//#############################################
//##
//##	Neue Welt
//##
//############################################

INSTANCE PC_Mage_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Milten";
	guild 		= GIL_KDF;
	id 			= 12;
	voice 		= 3;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_FRIEND;
	
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
	daily_routine 		= Rtn_Start_12;
};

FUNC VOID Rtn_Start_12 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_MONASTERY_MILTEN");
    TA_Stand_Guarding 	(23,00,08,00,"NW_MONASTERY_MILTEN");
};

FUNC VOID Rtn_WaitForShip_12 ()
{	
	TA_Smalltalk	(08,00,23,00,"NW_CITY_WAY_TO_SHIP_19");
    TA_Smalltalk 	(23,00,08,00,"NW_CITY_WAY_TO_SHIP_19");
};

FUNC VOID Rtn_ShipOff_12 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_MONASTERY_ENTRY_01");
    TA_Stand_Guarding 	(23,00,08,00,"NW_MONASTERY_ENTRY_01");
};

FUNC VOID Rtn_Ship_12 ()
{	
	TA_Smalltalk			(08,00,23,00,"SHIP_CREW_19");
	TA_Smalltalk			(23,00,08,00,"SHIP_CREW_19");
};
