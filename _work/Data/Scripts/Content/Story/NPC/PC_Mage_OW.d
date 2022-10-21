//#############################################
//##
//##	Alte Welt
//##
//############################################


INSTANCE PC_Mage_OW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Milten";
	guild 		= GIL_KDF;
	id 			= 2;
	voice 		= 3;
	flags       = NPC_FLAG_IMMORTAL; //Joly:  IMMORTAL																	
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
	daily_routine 		= Rtn_Start_2;
};

FUNC VOID Rtn_Start_2 ()
{	
	TA_Potion_Alchemy		(08,00,23,00,"OC_MAGE_LAB_ALCHEMY");
    TA_Read_Bookstand		(23,00,08,00,"OC_MAGE_LIBRARY_BOOK_01");
};

FUNC VOID Rtn_GornFree_2 ()
{	
	TA_Smalltalk			(08,00,23,00,"OC_MAGE_LIBRARY_IN");
	TA_Smalltalk			(23,00,08,00,"OC_MAGE_LIBRARY_IN");
};

FUNC VOID Rtn_Tot_2 ()
{	
	TA_Sleep			(08,00,23,00,"TOT");
	TA_Sleep			(23,00,08,00,"TOT");
};
