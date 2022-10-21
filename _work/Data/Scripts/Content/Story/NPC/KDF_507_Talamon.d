INSTANCE KDF_507_Talamon (Npc_Default)
{
	// ------ NSC ------
	name 		= "Talamon";
	guild 		= GIL_KDF;
	id 			= 507;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_B_Saturas, BodyTex_B, ITAR_KDF_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_507;
};

FUNC VOID Rtn_Start_507 ()
{	
	TA_Guard_Passage	(08,00,23,00,"NW_MONASTERY_CELLAR_15");
    TA_Guard_Passage	(23,00,08,00,"NW_MONASTERY_CELLAR_15");
};
