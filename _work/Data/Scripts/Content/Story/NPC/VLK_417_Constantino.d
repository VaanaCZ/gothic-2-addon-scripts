
instance VLK_417_Constantino (Npc_Default)
{
	// ------ NSC ------
	name 		= "Constantino";	
	guild 		= GIL_VLK;
	id 			= 417;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_axe);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_417;
};

FUNC VOID Rtn_Start_417 ()
{	
	TA_Potion_Alchemy	(08,00,22,00,"NW_CITY_ALCHEMY_VELAX");
    TA_Sleep			(22,00,08,00,"NW_CITY_BED_VELAX");
};
