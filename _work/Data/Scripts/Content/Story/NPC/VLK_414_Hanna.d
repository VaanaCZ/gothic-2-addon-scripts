
instance VLK_414_Hanna (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hanna";
	guild 		= GIL_VLK;
	id 			= 414;
	voice 		= 17;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_WhiteCloth, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_414;
};

FUNC VOID Rtn_Start_414 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_HANNA");
    TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HANNA");
};
