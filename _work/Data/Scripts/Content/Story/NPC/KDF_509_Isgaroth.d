INSTANCE KDF_509_Isgaroth (Npc_Default)
{
	// ------ NSC ------
	name 		= "Isgaroth";
	guild 		= GIL_KDF;
	id 			= 509;
	voice 		= 1;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Tough_Okyl, BodyTex_N, ITAR_KDF_L);			
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_509;
};

FUNC VOID Rtn_Start_509 ()
{	
	TA_Pray_Innos_FP		(06,00,21,00,"NW_MONASTERY_SHRINE_04");
    TA_Sit_Bench 		 	(21,00,06,00,"NW_MONASTERY_SHRINE_05");
};
