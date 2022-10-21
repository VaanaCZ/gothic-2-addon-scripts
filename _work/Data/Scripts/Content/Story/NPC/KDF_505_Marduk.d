INSTANCE KDF_505_Marduk (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marduk";
	guild 		= GIL_KDF;
	id 			= 505;
	voice 		= 5;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_OldMan_Gravo, BodyTex_P, ITAR_KDF_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_505;
};

FUNC VOID Rtn_Start_505 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"NW_MONASTERY_CORRIDOR_03");
    TA_Sleep				(23,00,08,00,"NW_MONASTERY_MAGE01_BED_01");
};
