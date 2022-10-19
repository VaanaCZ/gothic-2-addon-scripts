INSTANCE KDF_503_Karras (Npc_Default)
{
	// ------ NSC ------
	name 		= "Karras";
	guild 		= GIL_KDF;
	id 			= 503;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_L_NormalBart02 , BodyTex_L, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_503;
};

FUNC VOID Rtn_Start_503 ()
{	
	TA_Read_Bookstand 		(08,00,23,00,"NW_MONASTERY_RUNEMAKER_02");
   TA_Read_Bookstand 		(08,00,23,00,"NW_MONASTERY_RUNEMAKER_02");
};
