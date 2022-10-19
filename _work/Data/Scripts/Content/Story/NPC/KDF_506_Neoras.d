INSTANCE KDF_506_Neoras (Npc_Default)
{
	// ------ NSC ------
	name 		= "Neoras";
	guild 		= GIL_KDF;
	id 			= 506;
	voice 		= 1;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_NormalBart_Cronos, BodyTex_P, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_506;
};

FUNC VOID Rtn_Start_506 ()
{	
	TA_Potion_Alchemy	(08,00,23,00,"NW_MONASTERY_ALCHEMY_01");
    TA_Potion_Alchemy	(23,00,08,00,"NW_MONASTERY_ALCHEMY_01");
};
